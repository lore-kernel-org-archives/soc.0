Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A2CC63798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:44:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D9A20B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E36Ebg9H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9SqskTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D9A20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V/b8+BZ0Aqt+bVCZAMlRjLH6ZIodHg56ne/uCuwOZoU=; b=E36Ebg9HA/HxkvZJ1epVVsVMD
	1QhaUA1xF2zFSqUIVTxpdIkkDDoXWdNFF1v43snKqugA/+fZiTMqwXUVXl3iNocSXpbaO2VlhpDM1
	HRqbJlqsgqCsy/d6dslgd+cg5X2d6xSxz6ki0+eJSD837+2EPkE/HTca8M2R1hwWgLa6UYes1MYal
	exJBtd0Z56Vo3eD32yvzTFFTgKmMmdyw7jsKbeMPjuOTXrwZO7HlRBVhumtD3Y9wbM+yu9gIzuSbt
	emYutFuD/NPtm8VX/B0AKiMM0vEKMjqArz+vXf5BGdm9d/RkkRfGW9ypXUvkDB9ABwvRf2FaZyh31
	VRXOvVfKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieyN-0005PJ-DY; Fri, 27 Nov 2020 14:43:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieyF-0005NE-WB
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 14:43:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id p22so5330095wmg.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 06:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmILkMTyoFSh8KUN/oBiKweVuctrEgzCw8JtH2R1a8E=;
 b=H9SqskTS/zs6NgiGlTwctg9G3N+OwvL6AStD7fUJIVKzsPFM1iLkeHiFMb+Hts3hsJ
 sqT5kTKbrs5G6RYDT+I+LTZbyuXoI1MZojE7ieaTncG6jx+7sjCBoPNRoXIO71CwkG/b
 S/mMWl6821V5Wat2szh5VkYc8LI6SiMliC8jbrx+q6GiDF5dkoSKvisuqfmX4d42cZk6
 FEDutGX5atvyxpgZaGA2uTW5NP516NaCJDEs6882IJpLMSjKc+RC9hK5hB99Og5uBozA
 e5CFSNziK0Ufmwk+fo/7xzp5XoOVlGHcNfp2+T9c5jpnRohTBw34rQaS+WW3Kr83GiAK
 yaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmILkMTyoFSh8KUN/oBiKweVuctrEgzCw8JtH2R1a8E=;
 b=AmaBYU5dd2VBcbkMvr8nrhSukVaNSTWUvPIGpalvZmkrjl45nK9VFFu93D3A0TvU+p
 1izTDT7/q/clleItobZTWxihIHIRL3j6706SxTUgKD3AMy2BMhSaZldTmLItZrDI+Pwv
 TpwY9OXhYzXTOU0DhMuSxAI9LdWw6bAuAlPc6RBtsuYWPKLxgiefrLsNpw4to1fd8tqX
 xB0VjAmoKC2qoGqL0Tnunaxf8ruXOkw0MtP5N81yvh1X8VQTCpOkm/9A8nd7fbVpDyGX
 VXwityihrj0l17N8CnK57ebip4sODQCVdU1OZ+i5PhYTuglo+GVef4SzYemfi0ecMi0e
 ZBDw==
X-Gm-Message-State: AOAM531XDr3vjIb+aVxRqRP4OsR6hLxCBYRrpa7blpJ0JkdD5gHn8vG+
 x1QT9W0XIq523yl+po0uobA=
X-Google-Smtp-Source: ABdhPJxq0c+uoa2BKNWyG9kqene0iZGI5CKPKW3iTmgscQI7KT4rOSfergEXR3rrSEhOOeNymtyvTg==
X-Received: by 2002:a05:600c:219a:: with SMTP id
 e26mr9667529wme.168.1606488214360; 
 Fri, 27 Nov 2020 06:43:34 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p11sm15368298wrj.14.2020.11.27.06.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:43:33 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:25 +0100
Message-ID: <20201127144329.124891-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_094336_429641_9FC9E3EA 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127144325.NsP5VizdGBVNsqWaBKbtwLa6j9o58YPSOCNJL8xRgjE@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-soc

for you to fetch changes up to b9ce9b0f83b536a4ac7de7567a265d28d13e5bea:

  soc/tegra: fuse: Fix index bug in get_process_id (2020-11-19 11:43:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.11-rc1

This contains a couple of warning fixes and a fix for a mostly harmless
bug in the process ID retrieval code.

----------------------------------------------------------------
Lee Jones (2):
      soc: tegra: fuse: speedo-tegra124: Remove some set but unused variables
      soc: tegra: fuse: speedo-tegra210: Remove a group of set but unused variables

Nicolin Chen (1):
      soc/tegra: fuse: Fix index bug in get_process_id

 drivers/soc/tegra/fuse/speedo-tegra124.c | 21 ++++++---------------
 drivers/soc/tegra/fuse/speedo-tegra210.c |  8 ++------
 2 files changed, 8 insertions(+), 21 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
