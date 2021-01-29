Return-Path: <SRS0=PH9V=HA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D133C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DA92E64DE3; Fri, 29 Jan 2021 19:33:16 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725A964D9A;
	Fri, 29 Jan 2021 19:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725A964D9A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-qt1-f175.google.com with SMTP id z22so7535690qto.7;
        Fri, 29 Jan 2021 11:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mFHRAjZ8nX69MCGQDYe4XhkLBjs/Z0Ct7NBrTC9cTMk=;
        b=bsNrcZEarZgW0Po0NAJPjZDjwEgxeYhgqV49HLA8UIqo4TrNfcY3FMx4UuoGtW+uTA
         8g/OuUHdkb+r7K7KqShnAyAgQtXLD9bSZmLqwQm4FjS2dVEEb49aZaCQ1eiKtPP6eD4a
         PC8AtCw1nyWgvw7rHE9gouTZuHZbLYVwnTQH2BL1P5SECkSRN+lAZwQ0dpR6GQ2Scr2f
         7+Xbbdnzy4A5D0dagPA64jm+a+rkMYX/Mykl0F6jdfPSZuKFGY1mmyJbagaJBmxGnZkw
         /6QoObUoaWKg7h/G8boaCME75ddAM7swmX1OScKPoDFXvloJP+QcsNx+qpWUP1CRZjs8
         rSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mFHRAjZ8nX69MCGQDYe4XhkLBjs/Z0Ct7NBrTC9cTMk=;
        b=TtmpgQ8OoBOgM7F4T9gtXd6POHO/jf/vIcn176ag+BXDM7NPOI4sZfLUziGNsmK02i
         SNHzFPjm/Dpk3B/9D1EVrjMFlGyavBZoYJ8sw7H+Z+Q+HPiQAu9cwrAHxbrjGWsz1dut
         9exo0UZxVM3DbQq/nXUFhfgzDKo3qJPEu3k/Wsq+tHDTf3M+kEAYY0sGWu61K1pAPj10
         xbhhdjulBzNZEZVK0Hbm0sV8VZgiLmt7MSnO78QPRX76kKE4r0KFWHhy4rDz68Y/BbhO
         DuY+lKKaO0zVreQVXNH67AMI2TPrs0QTw+Yl+1XHraQxDXm9T2ibT1OPx7biuzNW7eSi
         09Fg==
X-Gm-Message-State: AOAM533y2d7GmPnwOKabVnrZFPJK6QauUB7MZhoVze29wx9eZ88dIJwd
	XLCDawY3m85pvpt7DiqHa/qNr1KFZLg=
X-Google-Smtp-Source: ABdhPJyFqwSvYvuleJAmmspJ/vdcbX8JOeFxIZoJZmk92hjCw6EzB1LLylZKkUhkeU94woi0pswpOw==
X-Received: by 2002:ac8:747:: with SMTP id k7mr1352633qth.348.1611948794899;
        Fri, 29 Jan 2021 11:33:14 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p23sm6813175qtu.4.2021.01.29.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:54 +0100
Message-Id: <20210129193254.3610492-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-defconfig

for you to fetch changes up to d93576c66c4b728c69920a2c25387d6e1fd4b902:

  arm64: defconfig: Enable Tegra audio graph card driver (2021-01-21 19:59:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.12-rc1

Enables the Tegra SoC thermal driver that is used on various Tegra132
and Tegra210 platforms, as well as the Tegra audio graph driver that can
be used to enable audio support on Tegra210, Tegra186 and Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: defconfig: Enable Tegra SoC Thermal driver

Sameer Pujar (1):
      arm64: defconfig: Enable Tegra audio graph card driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
