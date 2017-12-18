set @_tenantId = 1;
delete from cc_question_type;
INSERT INTO `cc_question_type` (`id`, `tenant_id`, `code`, `name`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) 
VALUES (1, 1, 'risk', '分析评估', NULL, NULL, NULL, NULL, 0);


delete from cc_question;
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, 1, 1, '您现在的年龄是？', 0, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (2, 1, 1, '您目前的家庭净资产是？（折合人民币）', 0, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (3, 1, 1, '您的家庭年收入的状况是？（折合人民币）', 0, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (4, 1, 1, '以下哪项最能描述您的过去的投资分布？', 0, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (5, 1, 1, '以下哪项最能描述您对投资期限的偏好？', 0, 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (6, 1, 1, '以下哪项最能描述您对投资历史经验？', 0, 6, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (7, 1, 1, '以下情况，您会选择哪一种？', 0, 7, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (8, 1, 1, '对投资以下哪项最能描述您投资的目的？', 0, 8, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question` (`id`, `tenant_id`, `type_id`, `title`, `type`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (9, 1, 1, '您最倾向于选择以下哪一种产品组合？', 0, 9, NULL, NULL, NULL, NULL, 0);


delete from cc_question_option;
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, 1, 1, 'A.18-30', 3, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (2, 1, 1, 'B.31-50', 5, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (3, 1, 1, 'C.51-65', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (4, 1, 1, 'D.高于65岁', 2, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (5, 1, 2, 'A.低于600万', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (6, 1, 2, 'B.600万-2000万', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (7, 1, 2, 'C.2000万-1亿', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (8, 1, 2, 'D.大于1亿', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (9, 1, 3, 'A.收入来源稳定，平均年收入在50万以下', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (10, 1, 3, 'B.收入来源稳定，平均年收入在50万-200万', 4, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (11, 1, 3, 'C.收入来源稳定，平均年收入在200万以上', 5, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (12, 1, 3, 'D.收入来源不稳定，过去五年中平均年收入100万以下', 1, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (13, 1, 3, 'E.收入来源不稳定，过去五年的平均年收入在100万以上', 3, 5, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (14, 1, 4, 'A.大部分投资于银行的存款和理财产品，少部分投资于其他金融产品，比如基金和股票', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (15, 1, 4, 'B.资产均衡地分布于存款和银行理财产品、信托或资管产品、基金和股票等', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (16, 1, 4, 'C.大部分投资于股票、基金、外汇等高风险产品，少部分投资于信托等类固定收益产品', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (17, 1, 4, 'D.投资多元化，以股权投资和资本市场投资为主，包括股票，期货等', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (18, 1, 5, 'A.以6个月以内的短期产品或方便赎回的流动性强的产品为主', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (19, 1, 5, 'B.在资产配置的基础上，以1-5年的中等期限的投资为主', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (20, 1, 5, 'C.在资产配置的基础上，以大于5年的长期投资为主', 5, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (21, 1, 5, 'D.通过资产配置，均衡分布于短期（小于1年），中期（1-5年）和长期（大于5年）的期限分布', 4, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (22, 1, 6, 'A.初涉投资，经验尚浅。具有1年以内的经验，主要接触的是基金和股票等公募产品或信托类型的类固定收益产品', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (23, 1, 6, 'B.略懂一二，经验尚可。具有1-3年的经验，主要接触的资本市场产品，包括股票和基金；或者信托和资管类的类固定收益产品；接触过海外市场背景的产品', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (24, 1, 6, 'C.比较熟悉，较有经验。具有3－10年的经验，熟悉资本市场产品，包括股票和基金；或者信托和资管类的类固定收益产品；或者私募类的投资产品以及房产，贵金属等投资；接触过海外市场背景的产品', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (25, 1, 6, 'D.深谙此道，经验丰富。拥有10年以上的经验，熟悉通过股权和债权等方式进行的实业相关的投资或房产投资，或者或者熟悉资本市场产品，包括股票和基金；或者信托和资管类的类固定收益产品。对海外市场的投资有一定了解', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (26, 1, 7, 'A.有100%的机会赢取5000元现金', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (27, 1, 7, 'B.有50%的机会赢取5万元现金', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (28, 1, 7, 'C.有25%的机会赢取10万元现金', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (29, 1, 7, 'D.有10%的机会赢取50万元现金', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (30, 1, 8, 'A.保全现有资产，抵御通货膨胀', 2, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (31, 1, 8, 'B.多元化配置分散风险，稳健增值，考虑资产传承', 3, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (32, 1, 8, 'C.增加财产性收入，达到或巩固财务自由状态', 4, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (33, 1, 8, 'D.实现资本增值和继续的积累', 5, 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (34, 1, 9, 'A.预期收益60％，最好150%，最差损失100%本金', 5, 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (35, 1, 9, 'B.预期收益20%，最好50%，最差损失30%本金', 4, 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (36, 1, 9, 'C.预期收益15%，最好20%，最差损失10%本金', 3, 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_question_option` (`id`, `tenant_id`, `question_id`, `content`, `grade`, `sequence`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (37, 1, 9, 'D.预期收益4%，最好8%，最差收益0%', 2, 4, NULL, NULL, NULL, NULL, 0);


delete from cc_risk_rating;
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (1, 1, '保守型', 1, 0, 60, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (2, 1, '适度保守型', 2, 60, 70, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (3, 1, '平衡型', 3, 70, 80, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (4, 1, '适度进取型', 4, 80, 90, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `cc_risk_rating` (`id`, `tenant_id`, `label`, `value`, `grade_min`, `grade_max`, `comment`, `create_date`, `create_user_id`, `update_user_id`, `update_date`, `is_delete`) VALUES (5, 1, '进取型', 5, 90, 100, NULL, NULL, NULL, NULL, NULL, 0);


update cc_question_type set tenant_id =  @_tenantId ;
update cc_question set tenant_id =  @_tenantId ;
update cc_question_option set tenant_id =  @_tenantId ;
update cc_risk_rating set tenant_id =  @_tenantId ;
