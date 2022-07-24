Return-Path: <SRS0=nxGl=X5=protonmail.com=linmengbo0689@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89272C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Jul 2022 09:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3ED25C341C0; Sun, 24 Jul 2022 09:55:42 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FE10C3411E
	for <soc@kernel.org>; Sun, 24 Jul 2022 09:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FE10C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Date: Sun, 24 Jul 2022 09:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1658656538; x=1658915738;
	bh=/wWDAq/zoQAzjTO22i09RhqoYU9jXUQjE7mlukPwWW0=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=GXudu4lp86OgwKJ9jFePLCMO2VknlY8ix+IQxn7kOtmA+hp0ME5h7UrmZYcSuBpoR
	 Nt/jVoebQAFhW6CWjbGk08PaNTAUUrST5sq1WTJDMAkhmb/7ea0VqqaSml6NIfwdxC
	 nqwpOmGL7NhklOrmtjnsfMKAd7oumOSweZ+1XfH/98rbejV2wnpJuwQ6Uj57CU5Num
	 BtaT20Ne3Jer32lAyzU+lASSw1cN4AoBWPqMCHhK7j7vTFJ0/xVVbK6gCAoVO1no/M
	 ATcNnQA7NQf7tI6HU8ZiKT+JU4ba82+i1bpGvnxq/tV0YlemwBowpy20TY2tZ2/6tr
	 XtTfZW/EwVs0g==
To: devicetree@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Boyd <sboyd@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, soc@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reply-To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Subject: [PATCH v7 1/5] dt-bindings: qcom: Document bindings for new msm8916-samsung-e2015 devices
Message-ID: <20220724095346.14022-1-linmengbo0689@protonmail.com>
In-Reply-To: <20220724095039.13568-1-linmengbo0689@protonmail.com>
References: <20220724095039.13568-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the new samsung,e5/e7/grandmax device tree bindings used in their
device trees.

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index 5c06d1bfc046..b004f42bc277 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -164,6 +164,9 @@ properties:
               - longcheer,l8150
               - samsung,a3u-eur
               - samsung,a5u-eur
+              - samsung,e5
+              - samsung,e7
+              - samsung,grandmax
           - const: qcom,msm8916

       - items:
--
2.30.2


