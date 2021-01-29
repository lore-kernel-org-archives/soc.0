Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C09C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C5B64E08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28C5B64E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uq+dN9BhMvVqBk/01+ICtRZKh0DUSqB8WVafT+Z9JSY=; b=Fk8e2D6LspOc3IRkRkDmMBB7/9
	2CPmm+LKF2BSWGShGjHixp1r1JELwiYT7nj/6CRfvkJQK2RR6RWOI2MOeoZo5EhsI5dz0omKcYxKq
	Ju7gVIUdQqjS1bWvj9Ce91Ggzkdpc4w0HgNXr5ISe9I8tU4SqcvY/T0xsDI3eOf3RnZYhR2IFpQek
	7OzbJMOi0xTKe9ceTsehrQb4h6i0tLq1zxiBeJN9F6XPx6+x/iVntjfeiiWdxNXcti1Ixlz/wWmT3
	d/TtG+yTFcRCwrQBRdnd16hsGCUg6vOYFxvLZoBzO3SsqMK4wOnLHgFm6berSvPZPi3Dz7xVtxs8T
	bpZuaVAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5ZVw-00021L-6f; Fri, 29 Jan 2021 19:33:04 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ZVt-00020T-K1
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 19:33:02 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id w11so4990219qvz.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 29 Jan 2021 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r67InYHj7w0UwUs8Y72vPHBfu31eAHA0VGcwVWjNNEc=;
 b=EdUVY0bLdPbBA2FZrTNiX66oEskosYO2f/QYo+UziRqOcrODVKbpBf3Gl+VaTtfGiA
 niihmJAk00TDIqH52b4XL4ZDnJzQCIN1lUlsuY5QkdNTA5/c/aCPnfWDvzH7dBtoRN+o
 /vWQVRWq6gK52JeBDNAopenV5jEoHjTMMBkTiTS7JhJZWt2o6EJi+YsqBlRO2v7R49a2
 f0ySZXgQsXdaVs5Z4KKyJ4tnR3m6Of2uSN2fk613Q9d8HoOrjBTuKewjwRA2YodNOo9b
 U5QC0ab2pM3BKg8g7LMFHsggSFm1CFbh/l98i/aHUFzf5n7qgSiNkdYaSm/ORndxjuRS
 pxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r67InYHj7w0UwUs8Y72vPHBfu31eAHA0VGcwVWjNNEc=;
 b=moLg0VLFKxk34SaporwhY8EiEgDj+KKRG54OCgQeYhktEozBxQoNbtFpD8vqGKgBVA
 H6EuVOGjpCvCNcfKqxtZX5wsxAjuhuWOq6VLmBQH9x5zicqQ7DnDFsU+fGAqdIgOk/Xh
 /mn631gYLHYB1V7XcQzBmVpPQyzcJ/E8uCJOINVQY+iqoc6I1rDbtOoLgY8FLv1acUSV
 emPQUq7cZS7lNSJ+dALQ0h9XRhsLg5UCpRgUFx2/lw/S54KPeDa7jvLg39mLfjqihKK4
 cdthTTsu4Kz0FV3Lk5cq5O43EH79yfgvH9f6R+qdBaAqm/2F1AiwBypGdfqtiP3N/vzi
 sJ/A==
X-Gm-Message-State: AOAM530lV+RPf0brK3YaZVdGWvTGoRS1FNivodX8SGriPLwbbgrwD43J
 1dIsl3+CVYMDi6eA0D0xtNA=
X-Google-Smtp-Source: ABdhPJy+w1P0mfYDxPTKAsKLMxfdPnzKm1nQ1m/wfdbrlcGXGt5Vna74AeVZkCwDJts+0hKT8dUcLg==
X-Received: by 2002:a0c:e28c:: with SMTP id r12mr5539465qvl.34.1611948778317; 
 Fri, 29 Jan 2021 11:32:58 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v15sm5751291qkv.36.2021.01.29.11.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:32:57 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 1/6] ARM: tegra: Core changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:49 +0100
Message-ID: <20210129193254.3610492-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_143301_685760_C2B05FA5 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210129193249.vCZqPcaKjB1PJQU-JBaHnLzvkSw8R9jLHdz9QMlYMQc@z>

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-core

for you to fetch changes up to 680ae44526ea9b656238ac768c8b6130961a0bdb:

  ARM: tegra: Don't enable unused PLLs on resume from suspend (2021-01-19 18:20:42 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.12-rc1

This contains a single fix that helps properly track the enable state
for various PLLs during suspend/resume.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Don't enable unused PLLs on resume from suspend

 arch/arm/mach-tegra/sleep-tegra20.S | 38 +++++++++++++--
 arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++++++++--------
 2 files changed, 108 insertions(+), 24 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
