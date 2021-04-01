Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170DDC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:27:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E5F613B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E5F613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aGy8oqlG6kLYqLjJ22QFw0sgnNLNMP3tHdBoyosNLz0=; b=S9e4fUGj5LfLboSNFsKDhkhaU
	wwu2+42I62yY9Ul++fCt+tNbEv2uacqOjm/gPNl+Y8Ssy/npf3fvzxmDQbYI5Ah5UJwCg1EyG8OIV
	ZpiSbBUIkgIMXDbq7bglSj0br0NNvb0NpBYLNGTFjYuh7bxGUjuCzSv03Ih0o2ZP05GHi0qZbluvD
	7lfzfomQDi3JrjVF4r0JWOBXQBWRX7QJKE3h4GgWQOphgzfJPcvQmTh0OP8GSyMuw9sOMw3QJqhCR
	DXKSaxpl0XjSaF2b4X+gbMakk4fMwSNOE+ysdZzuVi+9sYnP4RETHjFE0+hXBLUTS6ByT5kcrmDpx
	3mDg+Khew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS15F-00AVz0-GR; Thu, 01 Apr 2021 17:26:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS14z-00AVv6-S7
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 17:26:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id u21so3977240ejo.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 01 Apr 2021 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REwstNQho+0HF6CmmQ9jvF2oPascfGsNa3A+M63+ZoA=;
 b=sxlOIJzZWh+CM7b7PEGZxLFNmCHPX6k8wsPuZ6h2RIHxQ0LKn/Lxg1y+Y3CEr8pR1L
 vyBGPjPtURl7QlifNLXLDJondO6It08jh0ZWcQVaKiQFiZ/U688PazfVCeubkHrMduUi
 9Kp7t9jF33JvgaMh8/eoiN2GNvhCfsXLfW7OWr/xpSQo8ThPPPqqyk9+Z9YME8uh9ssT
 vN+W3bpuoF/G0RPRTWrN199/fhPtfcyc8RIOWVgXdd0CFycQU2BjKZKDDdWZ3KOIjLsp
 GbRm/AyKxmCKL1oOee0YjrY0UOI0N+SEThm6AJHL3Ccr7fBEyLnfb8LqBLBh7xG5GGYp
 DYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REwstNQho+0HF6CmmQ9jvF2oPascfGsNa3A+M63+ZoA=;
 b=OBPomGe4RoG+xuIGY5Q6xKg8C4W3dmhhgIS90GoI3qsWiebSRM9exqIRtoUUasMKJm
 6YvJMqc11WP9n7+yF/mC+2+EA4YaUzogJh1oI3PkHlSHHbENcXfduTHnQET7b9DTxLlV
 165pVLbPyABqjLGkiDMQANjUseeJ6f9n34b6AzJt36B2sV04wxRN+YZrTb2N69tkm928
 X80wx6klNGmBZpSfLbonm9mOMp63IpU7qNS2taPVSkIrBCD0RRqHhO2FhOYikqmTiS6x
 wZ9Sz+fBhWJfydFB5+u1c5fKaJZAXtQeJlkk37mfxLp+4dtOxW7rTUWPC2C49RibA2/S
 gwXQ==
X-Gm-Message-State: AOAM532O0tAJWKaPiz+uBVMtfYfjdxb+RAYHSE6i5tF9hahBwHmR2rvZ
 GlC4jCZkYzF4F6yD/NsMDXY=
X-Google-Smtp-Source: ABdhPJxE13Lorh6skVD7dPNFfE3hH5Aow2jkICl6k92P5R+PgadH2/fn/9VFL8Fy9EYLRoXz6Hzn1g==
X-Received: by 2002:a17:907:629c:: with SMTP id
 nd28mr10385959ejc.267.1617297960950; 
 Thu, 01 Apr 2021 10:26:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id hd8sm2995528ejc.92.2021.04.01.10.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 10:25:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] clk: tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:19 +0200
Message-ID: <20210401172622.3352990-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_182602_260630_AB070200 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210401172619.novQyzkUFu6GKX9gKnQtrTx6anp0hkvf8uLjUm7I7Bc@z>

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-clk

for you to fetch changes up to 0c7ea2b1c850756140fef03bed0fbaf0957f120a:

  clk: tegra: Don't enable PLLE HW sequencer at init (2021-03-24 14:02:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.13-rc1

This adds PLLE HW sequencer support which is necessary for USB sleepwalk
functionality.

----------------------------------------------------------------
JC Kuo (2):
      clk: tegra: Add PLLE HW power sequencer control
      clk: tegra: Don't enable PLLE HW sequencer at init

 drivers/clk/tegra/clk-pll.c      | 12 ---------
 drivers/clk/tegra/clk-tegra210.c | 53 +++++++++++++++++++++++++++++++++++++++-
 include/linux/clk/tegra.h        |  4 ++-
 3 files changed, 55 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
