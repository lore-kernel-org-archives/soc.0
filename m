Return-Path: <SRS0=giUv=B5=inventec.com=Chen.PJ@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EBC7EE29
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 11:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83F92C4339B; Fri,  9 Jun 2023 11:52:43 +0000 (UTC)
Received: from mail.inventec.com (mail.inventec.com [61.220.76.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 731DCC43444;
	Fri,  9 Jun 2023 11:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 731DCC43444
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inventec.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inventec.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=sEx04; d=inventec.com;
    h=from:to:cc:subject:date:message-id:in-reply-to:content-type:
      mime-version;
    bh=EEbqQOffsxMaPWtW7UGxs6N/o1lBOZW5XM+gHa3cw9k=;
    b=HV2w3Rba7JA1eR1IwRlZkvNJqC8XgJGOJWG+jbZ7EBlvEb4FUBas8yC8ssuU3M
      0srULzYZecrVeKFKzCyVoSNu21ISNBCVK+vSPDwjQpX0ua4WL8O+6Z/laE7dFT
      rZqmJhNg281fgB5UtYeUIC4EFI/bSXAhrBKTGKTNz1XyWvY=
Received: from IEC1-EX2016-03.iec.inventec (10.15.2.59) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 19:52:34 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 19:52:34 +0800
Received: from IEC1-EX2016-02.iec.inventec (IEC1-EX2016-02.iec.inventec [10.1.254.221])
	by IEC1-MSE-FE2.inventec.com with ESMTP id 359BqS66062581;
	Fri, 9 Jun 2023 19:52:28 +0800 (GMT-8)
	(envelope-from Chen.PJ@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 19:52:28 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::3cbc:265e:12a1:d39b]) by
 IEC1-EX2016-01.iec.inventec ([fe80::3cbc:265e:12a1:d39b%7]) with mapi id
 15.01.2507.023; Fri, 9 Jun 2023 19:52:28 +0800
From: =?big5?B?Q2hlbi5QSiCzr6xmpfQgVEFP?= <Chen.PJ@inventec.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
CC: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>,
	=?big5?B?SHVhbmcuQWxhbmcgtsCtXq2mIFRBTw==?= <Huang.Alang@inventec.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Thread-Topic: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Thread-Index: AQHZmsjdyWzKt8FWXUGyE1efizUsDQ==
Date: Fri, 9 Jun 2023 11:52:28 +0000
Message-ID: <c5f1fbb0e6754394af41eb5083f64d89@inventec.com>
References: <b039b1b2673644af84db8f803bc7d156@inventec.com>
In-Reply-To: <b039b1b2673644af84db8f803bc7d156@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IEC1-EX2016-01.iec.inventec (15.01.2507.023)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.6.245.192]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 359BqS66062581
X-TM-SNTS-SMTP: 8FC9931BA941FCBC45B2527A75CA23D9CCB5FC066D5F223A6C00B5FF3DDBF2052000:8

RG9jdW1lbnQgdGhlIG5ldyBjb21wYXRpYmxlcyB1c2VkIG9uIEludmVudGVjIHN0YXJzY3JlYW0t
Ym1jDQoNClNpZ25lZC1vZmYtYnk6IENoZW4gUEogPENoZW4ucGpAaW52ZW50ZWMuY29tPg0KLS0t
DQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlh
bWwgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlh
bWwNCmluZGV4IDFiNTg1ZTU1NDc5MS4uZmI0Y2U1ZGYyZmEwIDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1s
DQpAQCAtODIsNiArODIsNyBAQCBwcm9wZXJ0aWVzOg0KICAgICAgICAgICAgICAgLSBpYm0sZXZl
cmVzdC1ibWMNCiAgICAgICAgICAgICAgIC0gaWJtLHJhaW5pZXItYm1jDQogICAgICAgICAgICAg
ICAtIGlibSx0YWNvbWEtYm1jDQorICAgICAgICAgICAgICAtIGludmVudGVjLHN0YXJzY3JlYW0t
Ym1jDQogICAgICAgICAgICAgICAtIGludmVudGVjLHRyYW5zZm9ybWVyLWJtYw0KICAgICAgICAg
ICAgICAgLSBqYWJpbCxyYnAtYm1jDQogICAgICAgICAgICAgICAtIG51dmlhLGRjLXNjbS1ibWMN
Ci0tIA0KMi4yNS4xDQoNCg==
