Return-Path: <SRS0=fa5v=XS=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD76C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 03:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD2D7C3411E; Wed, 13 Jul 2022 03:06:30 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F249DC3411C
	for <soc@kernel.org>; Wed, 13 Jul 2022 03:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F249DC3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id i126so12933638oih.4
        for <soc@kernel.org>; Tue, 12 Jul 2022 20:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYPMLoqpObkqC3vgX9JDRezJjjz1Bs5ZuvCnnY/zKFg=;
        b=Rf6IhA51Sd4oNvbXtVVGzOFdtvYjN5ahcBK0IiYWjfCzzj5CnmD5/UzYx15R0Rm2eg
         yL5QlMwV21M+To8lxcJvUuZ8/xyx1bI9JdUgLMJodN5jiyViQOtD1YCdtiIVEINrQ9Aj
         fDVWnURK8zX1vkmIvOt5f1YR9+AvJHUFyETcR0FHNN9OkPXqaFyZ9++wDWVJ+QXDcMzI
         otAFRBk2WTM49/NyVk+drztRfCaqHFX282DrNFus3e56oS2i88aD2wVSzOoSEzh88Jcf
         3fjBDwX6c0Lrgivp8rtDhinF85U3LBmyw31KWxAl+BtwCKVlloBePfctTv6Yf2S4oRHT
         RqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYPMLoqpObkqC3vgX9JDRezJjjz1Bs5ZuvCnnY/zKFg=;
        b=eoWHu4G3tzVB/U+tJEBlSalgVthsynJwKYAQawTY//+zA3VWKIOfbzaPczK5LFBmLQ
         LpOLSTE95BF5omO/p3Kgtc6mxsKsdPZE/7a1BcO2uc6zZZaZVAlkbv4VYSkLTzTplkkO
         BxsUnstGzPZxm7x02tLp2WL40Z3oYCew0eakAjicxXvIktxIYCmFseviMb4RkZOQo73k
         /ak+kpA2wyvOKDoAi8KpGQTkMGDPN6SIzeLeI2E8YtfvCdPODIcIr+jbCKKH0K047ag5
         U9rD3HvX/kyMW7rl8qVXk1lusbXy6eQdEK095ulia28gcG/HKSAfqKSte8m7hgz7FOjE
         WwnQ==
X-Gm-Message-State: AJIora9Kh9lU4zKzr38gAf8bslL9O0BcLhIkOSiwXTwRlnpor7kB9/d0
	UQxkJB6XyonqWIftdiVr9z8fzg==
X-Google-Smtp-Source: AGRyM1v+pWl2D1Z4tUtCZV9U8RJqsB5Q0JzfADmQ+eSX+oMcadn5yvrWUDoaGnwE6sTuPdabsUWfgA==
X-Received: by 2002:a05:6808:3088:b0:33a:19c0:c95e with SMTP id bl8-20020a056808308800b0033a19c0c95emr2995752oib.41.1657681589046;
        Tue, 12 Jul 2022 20:06:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g30-20020a544f9e000000b003351fa55a58sm4826865oiy.16.2022.07.12.20.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 20:06:28 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm DTS fixe for 5.19
Date: Tue, 12 Jul 2022 22:06:27 -0500
Message-Id: <20220713030627.1371156-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.19

for you to fetch changes up to 03110b46c99bb0c712f46bec660b1c3f674ce100:

  ARM: dts: qcom: msm8974: re-add missing pinctrl (2022-06-30 22:13:35 -0500)

----------------------------------------------------------------
Qualcomm DTS fixe for 5.19

The pinctrl state was lost in the recent refactoring of the MSM8974
Devicetree, this contains a fix for this.

----------------------------------------------------------------
Luca Weiss (1):
      ARM: dts: qcom: msm8974: re-add missing pinctrl

 arch/arm/boot/dts/qcom-msm8974.dtsi | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)
