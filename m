Return-Path: <SRS0=fJuS=5Z=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3522C61DA4
	for <soc@archiver.kernel.org>; Sat, 28 Jan 2023 19:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D691BC433D2; Sat, 28 Jan 2023 19:38:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEE99C433EF;
	Sat, 28 Jan 2023 19:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DEE99C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id m7-20020a17090a71c700b0022c0c070f2eso11135599pjs.4;
        Sat, 28 Jan 2023 11:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlafoE+S4398adggWZFb3z1n3uZqd/dW1P6s2QCh+fI=;
        b=YsEa/l/ChfjwfLRWt59VGt/J4T54WWvT8o7lb+NJc/GVI9pkPS8PmC9VHX4TpMVgRM
         LKV2CwWl1/WL+qg6sNXJo72aWFJ3oyYJfIZcH4cjjHQdXBQ/h6cqMgvWtTiKvaRD7AcS
         Yu0kjPjioTXQyEftF3yC9yGhXUPS2vkWa5AidS5WPvaTO5gCxzWQn8QS4KRBSWFExB0l
         2q+fI5sk05xQiafJmZuWdt7+SIzA5i2Ufut1oBuJ8se++oHSbFSnSLOR0o6m8DtHzofn
         ILrMGwRJM50j2SsPgKC7ZCCiw2yrxz8SxEb8MpOh/dq+n6lX0h6YdKjVRzaK115NQahp
         5QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlafoE+S4398adggWZFb3z1n3uZqd/dW1P6s2QCh+fI=;
        b=GLdFwvxU4pIo6zC6CAMDeAoyIbhK52nIBZRnM27dhdC+yh5hhboRLczaXCnIW5ZEAL
         St6kww4a/othIjflFKfksCJ3xAgzB+33AN5ivePfShp33YwVBeKTPIY2K3EPznEsVKfA
         KLy196uyKkCLPHW5b2HUQqsToCqkAzGcKForT159DTRVB89sNAbskjofwdxiDU7Y2Q1o
         xOnUARB393aGxGKmKf136aLf35TgyCDkIMkR88AUo5RnYAQ1g0WVVlbCzy6T6BU7Xq5H
         c09SWobqirj54lkbh7QrkdDIqhs+AWYZY3sAdqHAZKgDDESawUhKHswJVoN+VPvXvXQP
         22bA==
X-Gm-Message-State: AO0yUKWaD5RhCcHviQqYb7ogPMDr1WCKV9L3mnwlpr9r0tCC0qfQlU4C
	yCAF/jwobxmaQQ84MVMBuvTmeuGxi1GVig==
X-Google-Smtp-Source: AK7set+D9Ml1hJQhZL2+rXM0yqHClwMmqAYNjMQZ2epNTWFOvFpN+BhT21f7NrQ1iGacsHonAu8iNw==
X-Received: by 2002:a17:902:d4ce:b0:196:2ba5:8a9d with SMTP id o14-20020a170902d4ce00b001962ba58a9dmr17043609plg.56.1674934719916;
        Sat, 28 Jan 2023 11:38:39 -0800 (PST)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id c15-20020a170903234f00b00194d14d8e54sm4845265plh.96.2023.01.28.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 11:38:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <ray.jui@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/5] Broadcom devicetree-arm64 changes for 6.3
Date: Sat, 28 Jan 2023 11:38:34 -0800
Message-Id: <20230128193834.1628831-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/devicetree-arm64

for you to fetch changes up to 3a7b283821650ed1437ab50a8e5f14381c4436db:

  arm64: dts: broadcom: drop deprecated serial device_type (2023-01-23 10:09:58 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 SoCs Device Tree updates for
6.3, please pull the following:

- Krzysztof aligns the SMMMU Device Tree nodes to use the desired
  regular expression matched by the dtschema and he also removes the
  deprecated "device_type" property for serial node(s)

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: broadcom: align SMMU node names with DT schema
      arm64: dts: broadcom: drop deprecated serial device_type

 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    | 2 +-
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)
