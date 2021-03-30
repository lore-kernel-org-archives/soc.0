Return-Path: <SRS0=etRg=I4=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4768C433DB
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 18:40:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 724CE619E2; Tue, 30 Mar 2021 18:40:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BAE5619DE;
	Tue, 30 Mar 2021 18:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BAE5619DE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f172.google.com with SMTP id f3so3150274pgv.0;
        Tue, 30 Mar 2021 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siZMxXZOJRsfxi+OErPq5t5HqTLg1w+rpgYWkosO2js=;
        b=ZhhJni7CQt/pYsycCrqZ1AUzEk+9K34cf+Su3fHPjb2sniCX5c+UZRCnM9mpNhYIpO
         qz7fG39SxU/sRm0PqXPH7Fthd3E97DW8Kve0sZGtk+iB9JIbLzg/cBcIX7M/K979JKjn
         /dsIWjdScn5i+oANkXc4YHmU7t7SXfEM6vUUN2qDhAKVRojtapeuDOFKX99MuITejb5z
         tH5m4clVajepbeA+yR1pIKvQs0Isr72DkkynNbprBjuMzy1XT5xsXS9r9Fey2gmuWIEp
         AMsxoJpKUS5Dv4QrEANQ+ZUoLWZGeHoEWCtBZYjdTt7KDr4+60KccbE1M/9Z8JR6pRC5
         MytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siZMxXZOJRsfxi+OErPq5t5HqTLg1w+rpgYWkosO2js=;
        b=n+El2srErS8102puoXLMzxPAtX7CidGnAC0Y4jIqHQlHUKr9eUIkmE/IGnf6rCAKq9
         8gkQ17ZhHDjZAqBbxhm1vIpqEFM/e1NXvBJpgOoPbjtr0H0TSE1yU+vDRBNf8PnQOWsM
         Luqa9hS6UvK3SQX03+thvr3xyCJ+D4IURBmPv+CDQtwGhKI64IehkDG7bk+q0A/JRX7z
         Z/jEzDKzN3uHkl7nuLN7iP7Z63axrpCzGvYbn4NcA5iky9ArVyxcoq65DArtO8duH473
         WbQ8Dwm8biRndyMluUbR3J6FhcAwxkhJUKWbWfHbj+famlRrPdYQSwJlbrqSA4fTG/Mv
         iedg==
X-Gm-Message-State: AOAM533DcxatWbV36kA9uaLnKtXLKCshgCgYczIWoqS4/MnSSeinFikW
	O/7nvIqHW2o8+o+MX6aR7DG9q6/4iu4=
X-Google-Smtp-Source: ABdhPJx9YoDb2GffSh/88l2OeS2XmU9QgOu0pnk47EXR7AaWE2yOtta7StZ12caFzb3KoEATPxrbBg==
X-Received: by 2002:a05:6a00:2163:b029:216:deaa:e386 with SMTP id r3-20020a056a002163b0290216deaae386mr30999519pff.72.1617129615226;
        Tue, 30 Mar 2021 11:40:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id gm9sm3307696pjb.13.2021.03.30.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:40:14 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 5.13
Date: Tue, 30 Mar 2021 11:40:06 -0700
Message-Id: <20210330184006.1451315-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/drivers

for you to fetch changes up to be6d99420306bb6b0abfff7a814564a614690db6:

  soc: bcm: bcm-pmb: add BCM63138 SATA support (2021-03-25 14:24:43 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64/MIPS based SoCs drivers
changes for 5.13, please pull the following:

- Rafal updates the Broadcom PMB binding to support BCM63138 and updates
  the code to support resetting the 63138 SATA controller

----------------------------------------------------------------
Rafał Miłecki (2):
      dt-bindings: power: bcm-pmb: add BCM63138 binding
      soc: bcm: bcm-pmb: add BCM63138 SATA support

 .../devicetree/bindings/power/brcm,bcm-pmb.yaml    |  1 +
 drivers/soc/bcm/bcm63xx/bcm-pmb.c                  | 30 ++++++++++++++++++++++
 include/dt-bindings/soc/bcm-pmb.h                  |  1 +
 3 files changed, 32 insertions(+)
