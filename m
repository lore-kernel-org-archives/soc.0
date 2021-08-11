Return-Path: <SRS0=byvG=NC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A1FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 09:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C68F160EBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Aug 2021 09:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C68F160EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SI0UI6mXpdtzFmtYEiVxvRWmIiH6exlBxj+nT1O2To=; b=Rnt9iz6oyOQjdD
	XB/Jp6Fyww8yU4eZcbdoP40nvmVXlXPbheZiTzmXGNHOt+k33XSF56Xg5yhqqKbUF+Ei1JGiTrKIm
	SjzscmSGLGKilveVq0n1AqvPFBXMSRmyP5w5ETsKgJH0qoJdypua8U4aq4CtGSKa87ImdtmvIL0cU
	uYwEyIWKAfRljLxJRCuylICyYjLsRWtgrDCRviVhcoLJ1uotZvVq5ZlFj3mKl7HrNdQEeaUK3VooO
	uc6XT3e1ANZMidfJHtwl2wyraUijvNk/TuuBLpEDAAwwsl62A1PGSWtEr7ULEeTNuQsX+yR5cUE8y
	4Ia0NDHgd3xUy0LI+ECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkUk-006Hi4-5A; Wed, 11 Aug 2021 09:25:58 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDk2P-00698W-KU
 for linux-arm-kernel@lists.infradead.org; Wed, 11 Aug 2021 08:56:39 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1032140653
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 11 Aug 2021 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628672196;
 bh=4UxhWMl2UKsgMwJ4KPtjlnO+CYaM79dqretD7p+dVEo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ADz/r+7OlvUkGgV+pwLW5I610AFn8G91bNEZwmXxTjztj/JacdxrfNgHqkDNfsSX/
 xQeWm3rP6DFXLsUT+R8SCueXSeAt4bflXz4Va3VVuv7IKpE0Igbooocpst0m5R1E8h
 rRL+kaUFxP13aZ7H1z3kuCesur4jhSDmO5dvLnH8ZWPBdvK7iJq8NUgo9gIXmFgBn7
 6NcJPkMIPCWZK5oJ0b9fsRa1hBPdV0iAHB8fsa4sQGW4Le56KS1QMHEyrZa0lEIUSA
 lfJHhcn2YtszPpNtsTyhqMWnaXkslQIiPh32wgbTvST1IwEuWA1hwR+MZpQi3tPBhy
 Vr+PmHTC9l7Eg==
Received: by mail-ed1-f71.google.com with SMTP id
 u4-20020a50eac40000b02903bddc52675eso894705edp.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 11 Aug 2021 01:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UxhWMl2UKsgMwJ4KPtjlnO+CYaM79dqretD7p+dVEo=;
 b=WK3wvg/LWkF4zCAEWnvLJCVs35LdnrvuyXXYZZq63dlJEwDnwdrwf4MFRkigZ/MszU
 CWdHkVA1mRQMFY4q5iTcj6z36ofd7FCcRAFz93o93vuMtGBdgepiBlUZBwr5+nt6QIR/
 CKmxlstFbk+3WD6NEARmLOp+WkwhevCJk/ZPZPEbcfTssT8+6L82dJNsYHWJqfu8fg3F
 zfj96YZ/sE1CEnZ+vnxOZY6FOUsKnDpllQf0i0Rzt5kc2tqHHCrnkbdCL7ca+mpSwKSt
 h0Mi3aT2wfPHe+actY4nImuu5FmttKm/IHRCktjdZniOpUIr0SXnnsd63OyDWpveP3fY
 DB+g==
X-Gm-Message-State: AOAM531oSCbJL+DiUTn9tCRt4o7fmfnrp6Sd62A3LB3U1+RCY2wvIHY1
 MBUDgDNGGte4a6Togp+wtqwhYUiNsVgBkVn3BwbQ4Jtuz9Zbgh9f+O+B6lBRxERIkD+E5RvwfS8
 d5/LeJ709/3kcHpiPdayh8MP/Y9kbcRAr64ZG7vFzz3ra/FUQh6r2
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr2668520ejc.188.1628672195682; 
 Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpmVBBAuHJt1OGlhgZTnKfjQF5Z2T6ege4UKylVzKjJZwBAKyNkyO/TlXJPJzdEYl+DoWCBA==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr2668511ejc.188.1628672195534; 
 Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id x4sm7834003ejb.106.2021.08.11.01.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: DT64 for v5.15
Date: Wed, 11 Aug 2021 10:51:28 +0200
Message-ID: <20210811085128.30103-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
References: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015637_891006_ED8EC61B 
X-CRM114-Status: GOOD (  10.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210811085128.D2dnw15UVF6AvJ16qEpmAhwG0nyup_qoIVdGjCL5pd8@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.15

for you to fetch changes up to 01c72cad790cb6cd3ccbe4c1402b6cb6c6bbffd0:

  arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7 (2021-08-09 12:36:41 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.15

1. Add CPU topology and cache information to Exynos DTSI files.
2. Correct GIC CPU interfaces address range on Exynos7.

----------------------------------------------------------------
Alim Akhtar (2):
      arm64: dts: exynos: Add cpu cache information to Exynos7
      arm64: dts: exynos: Add cpu cache information to Exynos5433

Krzysztof Kozlowski (2):
      arm64: dts: exynos: add CPU topology to Exynos5433
      arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 102 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi    |  37 ++++++++++-
 2 files changed, 138 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
