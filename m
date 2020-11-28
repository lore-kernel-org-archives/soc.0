Return-Path: <SRS0=l92L=FC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A147C63777
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0A14B246CC; Sat, 28 Nov 2020 16:34:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24F5246CA;
	Sat, 28 Nov 2020 16:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ux08/Km4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24F5246CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f169.google.com with SMTP id e23so1911938pgk.12;
        Sat, 28 Nov 2020 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emaTbDYD/JJjwuMKFVHHIeJ3kVna3RHAuUtfrRX8E4I=;
        b=ux08/Km4JMSvH0WPX0hg9KNScuEZ4DQ8NT9D0M5MXoWjD1X+7ngycVg3RPUQ6E5h1s
         pLyHlDKLkcephlCo7iKu3M69GwoJ6OxcEWBp9ZqTZkCbQRJbHDkuvUpRD997CeilPX0S
         BAr+RmoJdJ4PZzYzDD1NlwtzFEEfsu1NtkM9XomTLzQx+80HcDAUBpUAGE0dC/8mTq1c
         HwF+l72wOt4onEuBeHbxVqzlAS23wtOOccwlskNZVYMsluErNplsy5Q3R1LdH21a+SjO
         0+JWYSuI7LPa9R2g+47Ic0MVHhaDM2boIWKq+qdthUmXCF7qFLrb6TOqNaLrSi2aHYov
         WsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emaTbDYD/JJjwuMKFVHHIeJ3kVna3RHAuUtfrRX8E4I=;
        b=lW6bWds3oeDBqAyEMgyKiUja1LyrvOkC4x3onIP3UFSE7YIyPscavEL4Mzc4uEeCrX
         hC6M/pP1hPn6a2cr+YVTMYkduX9Zcj5yKbXkco4S+ICzAm57JbEYz9fR0TSFuqbGtZ1S
         CzGnCVOEKAGR33DF1X+1oM7rP3HToazFlBC5PINljVNte8+K+HrBxqfBfFKccFSA/8WW
         lkudpbyZUk9tXQH0ggNWONkRfFx73ZdmmwMuZBPJduKZYGA2crGK6AfY60ja9CreS1Pz
         VT0DHWghbkMjBXSYQOMGmwAIY/54JaS7BtAJBY6xBhMuU/bIzvKHi7FIXasw/AK1eAiY
         fzag==
X-Gm-Message-State: AOAM533f+zZH7OT3Xeubz0879VQdJtADMYu7IveVuvfaX+tlpRJEYRlM
	xVUrUgQ+jCSFjS49EhVxD9CiaZb9BT8=
X-Google-Smtp-Source: ABdhPJxJ435GLXBA8UpRLaO8kPw/CciZV0JSPeJi9WU13MSzOWqOadmtKc8UedI/g25j6Qwx1tb5vg==
X-Received: by 2002:a63:1505:: with SMTP id v5mr11155365pgl.434.1606581257876;
        Sat, 28 Nov 2020 08:34:17 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 08:34:17 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/5] Broadcom defconfig-arm64 changes for 5.11
Date: Sat, 28 Nov 2020 08:34:07 -0800
Message-Id: <20201128163410.1691529-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/defconfig-arm64

for you to fetch changes up to 6a7dc2b3639adc7f9ff5c148aeaef0ee775f6c3a:

  arm64: defconfig: Enable ARM SCMI protocol and drivers (2020-11-27 20:52:00 -0800)

----------------------------------------------------------------
This pull request contains ARM64 defconfig changes for 5.11, please pull
the following:

- Florian enables the ARM SCMI protocol, and the common clock, HWMON and
  CPU frequency scaling drivers since those are used by ARCH_BRCMSTB
  platforms

----------------------------------------------------------------
Florian Fainelli (1):
      arm64: defconfig: Enable ARM SCMI protocol and drivers

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
