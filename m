Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AB7C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F24F61477
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 05:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F24F61477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hTTuATN0/xgpp3R6xxcItN4YZfrp32Raau/IWc7CmH0=; b=uivZdU9zW12bIDG4TeADM0DIDz
	hHgiRplTe77RC38NNgy/ns935p//RqvVmUO+a089Fomj0YMfXbm6IPXfZoBIFMzW3XXzOXbQ4sclc
	Dh2+qtTjlG4/m0c5LQX0qZ9XypT1PJpKP1SVa8kLdCLWOOSmUlUQ/1+mccG/ZPrDPHSFNrmzeBFA7
	gaYEajm25AHXfm56c0eSVproa9sRni8/VFIeQlyzL3gyNmx0bXMweBBKP2eO+hZsU0aycK4nI7gac
	eAY24hZB2TbvhR80YHPL4w97QlREw6EvllEcTDTefjBmCbsj/5jZ88bEZDVGJFPrkQBjbulesIIfM
	M7ElFHHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7X3n-0004j2-92; Thu, 04 Feb 2021 05:20:07 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7X3j-0004iK-He
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 05:20:05 +0000
Received: by mail-oi1-x22e.google.com with SMTP id d20so2504102oiw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Feb 2021 21:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJzCjy0nMms07nuaWu9NrrP4hmPYEqwniCQtXa1rukQ=;
 b=KQ2AhCWW56C5JV7cqUzGBtT+Jp2isIlTZStXIUFAhpb088QKrxZ241ncAwPABWuv1f
 j/HuikFvkj90ccJsW5w7cFva4BuCyUYrC/WcIsel6hzAtAo2NqjhldrxEKKTjMxAmq5Z
 zg/BA9QxcJ9tTw2ttPIHTBw4FHWaDagFoMZ2Hi3viO633+rzFz7xb9jcs9f39hYL+Bqb
 Ms724vHHecjzGL+D5ucmMkK1A35F6OC5DGzepiTOVicblOOn3mJa0YfHMdHhAulUjCna
 zSqfY/aX6rACUGnhFbax4GGbkXmOf1+fwbEAq3Lx3fWHcdPGAJGlqf3oYMWE3ICFX5cY
 HqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJzCjy0nMms07nuaWu9NrrP4hmPYEqwniCQtXa1rukQ=;
 b=WDogLf7qvd8au3JTAxIpgnXZc2MqGGg5yQLOBkl5kEXKG/U+MmExwI4m4UBpm93GuA
 wYblEaJuz5UE8ZDbZbj+MXuPPFfYJZaF3q983wA5Jb9kXblI9GzwyCfN6Y1RjjWBCboN
 kqVIJgAhkhdYge2ydQrDX1MR+yQwuzdSVrPo8tBD+OOez9SbddWFWrju3u9FbyjvFh7B
 rrx+N0JEJ4DJT34PX5QA+TIHaSmZdAsCwGc66XpN2xhcTGmp0AYD9GPKIfaT6UR3QfB7
 zLQsSrKT/8Jk9JL5EYXkBhD7YrVqBywldHtQLZHyX4CXYKCjnwwJo0aUdOSVv938i0Yz
 Yj4w==
X-Gm-Message-State: AOAM532N+g3hmeiWLL3zRGm6QQRoLERe1Y4YGj2JwYV00y2ZQTD7c/pI
 u9aQXmpYLtKAVwdpXbx5nhq4jg==
X-Google-Smtp-Source: ABdhPJzrkdaH7GRTiA5I5fleV+9Wgd1JQvQZ/aAfIsJO7Hji0lsIOEzjo1HSu7B6SES+76GMosBXTg==
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr3064386oih.32.1612415997898; 
 Wed, 03 Feb 2021 21:19:57 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l3sm945276ooa.12.2021.02.03.21.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 21:19:57 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for 5.12
Date: Wed,  3 Feb 2021 23:19:56 -0600
Message-ID: <20210204051956.388355-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_002003_908774_5B10EF9A 
X-CRM114-Status: GOOD (  10.00  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross <agross@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204051956.y7DalOKGWTRepvEpoXmpa1YRjlbsVFbojctHE8OtWus@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.12

for you to fetch changes up to e6c88b8e434f1a856b330a7c07e4ed338e41a92e:

  arm64: defconfig: Enable Qualcomm SM8250 audio config (2021-01-15 10:20:00 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for 5.12

This enables HID multitouch and TMPFS Posix ACL, for off-the-shelf
distro support on the Snapdragon laptops. It also enables display
clocks, audio configs and the LT9611UXC HDMI bridge for used on the
SM8250 and specifically RB5 board.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: defconfig: Enable HID multitouch
      arm64: defconfig: Enable TMPFS Posix ACL

Dmitry Baryshkov (3):
      arm64: defconfig: enable display clock controller on sm8250
      arm64: defconfig: enable Lontium LT9611UXC bridge driver
      arm64: defconfig: Enable Qualcomm SM8250 audio config

 arch/arm64/configs/defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
