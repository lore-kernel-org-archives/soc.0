Return-Path: <SRS0=FYTr=XZ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB998C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 23:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 760DFC341D0; Wed, 20 Jul 2022 23:01:44 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ECD2C341CA
	for <soc@kernel.org>; Wed, 20 Jul 2022 23:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7ECD2C341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id i126so12741983oih.4
        for <soc@kernel.org>; Wed, 20 Jul 2022 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o25Onl7W5ZVNjrmImxnkBTSvgWGk4UAcWc7YmpIZ6r4=;
        b=mK5F3e7LiNs/0CGm0JGzLchWjmGhAIkq+4IoVOpqXb6n3cpHI7cd57MntcGc0IyaXa
         a6WZI55Oj0lMwEvyP6VaRk649bnkQpGFppp5x18APUYhqL52SpQCHjLe/+9wMfeXPiIS
         O1L9S2XXzilDA41aVPJeUPIEPxeRLNHoEYsPF6XC2eMJKPex0yalZJhy4AkfZAUFZf8G
         KHabkEcGxM+dJlUAJmm6IqgmRxLLAm0N7CDCnthNkwp6nYFGue7oQuGFhNC4QuUbmwqh
         YyteQR2qhvJeoLabnPpahbVoMlEOG8oPtlVV8SP0OK+eo9uCOJMngLBA4aMa5PTVyv5R
         5N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o25Onl7W5ZVNjrmImxnkBTSvgWGk4UAcWc7YmpIZ6r4=;
        b=YQCyGQl6762bNU7fwb+TmG6pkHXTmYXEcxGYn/nzZlHuDlLjgWcvk3uAliB8I4irQA
         rV3b8ktjY8l6l4JFHJ2ZLCJDntBjRN/Rm9WGrTAl+vlGPZNf7AmEOdwMgqn5poqDZ52R
         NpKwtEbmwRtjgn8ow380gB5eKXsPm/NeQUco1UuIr7ri8TXSx2h7uqmiq/Ht4D1EveQf
         Ac8CVG9U7a6yz3CvcSsJEXNj3Nzg/3r4m8nqMUocPU1tsVfyIZmfA38qsQ+x+t5XpMcp
         a9NgzoZ0DRhLzEXrHxaz42WqSNqRvNp9xidnRWriNFOwAiK2CawnWt/zW6f7xqDLHSpr
         WpTg==
X-Gm-Message-State: AJIora+G2JOm8hVY9cON/NQo687EFosrZ59MljCT+UQfrZUdyUQvbQo1
	B9VUG0v3iviZIADLg9QqtWrIBA==
X-Google-Smtp-Source: AGRyM1ujUZBy++05futBPsAGLy0FI7423+W5FtvCMDAHJrVczv5Pc7TTBRPdPlzwE/C4lPbsRInXRg==
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id ch6-20020a0568081c0600b0033a9b3bb3cemr3414012oib.53.1658358102405;
        Wed, 20 Jul 2022 16:01:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b16-20020a4ae210000000b00435a4c8e3c2sm121321oot.40.2022.07.20.16.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:01:41 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
Date: Wed, 20 Jul 2022 18:01:40 -0500
Message-Id: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 76f11e77f919397f31198354cd0e0bd8e76f8748:

  arm64: defconfig: enable Qualcomm Bandwidth Monitor (2022-07-06 15:58:13 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20-2

for you to fetch changes up to 01579b88a03a90af73b584fed70d171c73c2c540:

  arm64: defconfig: Demote Qualcomm USB PHYs to modules (2022-07-18 18:56:02 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig more updates for v5.20

This enables a few of the core drivers needed to boot the 8cx Gen 3
platform and demotes the Qualcomm USB PHY drivers to modules, as they
don't need to be builtin.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: defconfig: Enable Qualcomm SC8280XP providers
      arm64: defconfig: Demote Qualcomm USB PHYs to modules

 arch/arm64/configs/defconfig | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
