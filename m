Return-Path: <SRS0=CUVb=4A=ucas.com.cn=honghui.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F57C4321E
	for <soc@archiver.kernel.org>; Fri,  2 Dec 2022 11:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FED4C433D7; Fri,  2 Dec 2022 11:15:29 +0000 (UTC)
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECDDFC433D6;
	Fri,  2 Dec 2022 11:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECDDFC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ucas.com.cn
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=ucas.com.cn
X-QQ-SSF: 0040000000B00080
X-QQ-FEAT: dokLFQtf6Hmfz/U1KS/IYmsbTaCViGDnrcjLzsekxkL1oyBqmfyutY5FWoJgd
	f3v3V/oO4dzfSRkTGcYQeSDIQe0SkFnOgc5LR5arohcc18OH095ZWExC644IHRgIOq8fgXp
	/c18flLht6OPknABlfWnx5pVR1c4wdcfUMRPPYi7ZAnDo1Zy9gr/T1MQJKnY5A+/pKYgUv0
	jPMZ72fPW6J5IRqTPdNE0+BvOVAxPvB/+e+ubtSRSzldb1AVTFHhpeCbxsVZpSHU5r3y0JE
	PAyP2MkKfh+PU/YyABMPYfIdrbo1M1V+LyEc6KP/Gd2xR0ngivM6cwNVnmX/WgPdMqXYd/P
	p+sLB/X
X-QQ-BUSINESS-ORIGIN: 1
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 223.72.178.174
X-QQ-STYLE: 
X-QQ-mid: qywaplogic4t1669979638t940312
From: "=?gb18030?B?zfW66bvU?=" <honghui.wang@ucas.com.cn>
List-Id: <soc.lore.kernel.org>
To: "=?gb18030?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzysztof.kozlowski@linaro.org>, "=?gb18030?B?Q2F0YWxpbiBNYXJpbmFz?=" <catalin.marinas@arm.com>, "=?gb18030?B?V2lsbCBEZWFjb24=?=" <will@kernel.org>, "=?gb18030?B?QXJuZCBCZXJnbWFubg==?=" <arnd@arndb.de>, "=?gb18030?B?T2xvZiBKb2hhbnNzb24=?=" <olof@lixom.net>, "=?gb18030?B?c29j?=" <soc@kernel.org>, "=?gb18030?B?Um9iIEhlcnJpbmc=?=" <robh+dt@kernel.org>, "=?gb18030?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzysztof.kozlowski+dt@linaro.org>, "=?gb18030?B?U3VkZWVwIEhvbGxh?=" <sudeep.holla@arm.com>, "=?gb18030?B?Q3Jpc3RpYW4gTWFydXNzaQ==?=" <cristian.marussi@arm.com>, "=?gb18030?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?gb18030?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?gb18030?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>
Subject: =?gb18030?B?UmWjulJlOiBSZaO6UmU6IFtQQVRDSF0gYXJtNjQv?=
 =?gb18030?B?Ym9vdC9kdHMgYW5kIGFybV9zY3BpOiBhZGQgdG8g?=
 =?gb18030?B?c3VwcG9ydCBQaHl0aXVtIEZUMjAwNCBDUFU=?=
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64
Date: Fri, 2 Dec 2022 19:13:58 +0800
X-Priority: 3
Message-ID: <tencent_0D838DEE0F4CB459055E19F5@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 4224319092
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Fri, 02 Dec 2022 19:13:59 +0800 (CST)
Feedback-ID: qywaplogic:ucas.com.cn:qybglogicsvr:qybglogicsvr5

Tm8sIEkgZGlkbid0IHJ1biBkdGJzX2NoZWNrLg0KDQpTb3JyeSwNCg0KQmVzdCBSZWdhcmRz
IQ0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBIb25naHVpDQoNCg0KDQoNCg0KDQoN
Cg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0t1K3KvNPKvP4tLS0NCreivP7I
yzoiS3J6eXN6dG9mIEtvemxvd3NraSI8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
Pg0Kt6LLzcqxvOQ6MjAyMsTqMTLUwjLI1SjQx8bazuUpIM3tyc82OjUwDQrK1bz+yMs6Is31
uum71CI8aG9uZ2h1aS53YW5nQHVjYXMuY29tLmNuPjsiQ2F0YWxpbiBNYXJpbmFzIjxjYXRh
bGluLm1hcmluYXNAYXJtLmNvbT47IldpbGwgRGVhY29uIjx3aWxsQGtlcm5lbC5vcmc+OyJB
cm5kIEJlcmdtYW5uIjxhcm5kQGFybmRiLmRlPjsiT2xvZiBKb2hhbnNzb24iPG9sb2ZAbGl4
b20ubmV0Pjsic29jIjxzb2NAa2VybmVsLm9yZz47IlJvYiBIZXJyaW5nIjxyb2JoK2R0QGtl
cm5lbC5vcmc+OyJLcnp5c3p0b2YgS296bG93c2tpIjxrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc+OyJTdWRlZXAgSG9sbGEiPHN1ZGVlcC5ob2xsYUBhcm0uY29tPjsiQ3Jp
c3RpYW4gTWFydXNzaSI8Y3Jpc3RpYW4ubWFydXNzaUBhcm0uY29tPjsibGludXgtYXJtLWtl
cm5lbCI8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsibGludXgta2Vy
bmVsIjxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsiZGV2aWNldHJlZSI8ZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc+Ow0K1vfM4jogUmWjulJlOiBbUEFUQ0hdIGFybTY0L2Jv
b3QvZHRzIGFuZCBhcm1fc2NwaTogYWRkIHRvIHN1cHBvcnQgUGh5dGl1bSBGVDIwMDQgQ1BV
DQpPbiAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIA==

