Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A29C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8BD60462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B8BD60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vo8LOvMHgL8UBrr01YJfp4y2xkSv9nQuG7+6t7BxF1U=; b=cXwSd59ciEy60W
	MvJktK/gH+dn4Bz3KEzkOv8k9HMkqfbQTQ5O+MH8Ar2yNM50y7GL3fNtX9c/SEQoOHLudvQbbEwT4
	znRzgd1aNXEGhVhD/AOI595rXniJ3+2pkmWPD7vBCclog/0FEVL0+kEKYULJTWqPtLTYUoU9gdkbT
	EBCmobxz6fcy22F68hzoy/kF9VA/deKra/1hRq1Lqx+mDmP6W7oRl59lz9a7F9EeMAxl9pf/Mmvgt
	jWsY0A5FvmZx5JyjMNTBEY+OEIUCIZ70bTXC4CrxWBOUrhRo3jYvJUOUl1Vzmafuw0L2qm46Mtv5k
	ps5JiLjE0tF3qkNOyJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZwk-00D5Dw-PV; Fri, 13 Aug 2021 16:22:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZwa-00D5B6-1u
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 16:22:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id r6so14060388wrt.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vu2kk2+ZSy2NLtNn5/uqEi9lhMnezhSZVswShT8ce2g=;
 b=Rld7Vvb9ZG4tAOM1XIDqx8C2J+r9MEFewhf8Y4n6MgbrByII00sJIlTmofYPxb6U6d
 PhLtXfccBAK078PbfN6ysepaxLB+g9Nf7bUwLis6Xvc+cPsLLl/0RMmYWdScimLqtwW1
 72guLKcLb1/ofF/AB6Pq/FYH9WxfRRHyCuBAP1Dx/0Obm00F6toV1lO7b/oI4A+YiY3i
 XA73VWPf4+6sPh6LFXWe5XkhYTpPxDWFgxP1oJ6tgbNaq9YbXdGswgRlJey7dICkwelF
 RhYiksX/WD32mb0PEcjozFG5bJCk2FXjlB+BaFjM2Ejvjl8XUZpUZkjcM/oacB3sAs17
 ZgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vu2kk2+ZSy2NLtNn5/uqEi9lhMnezhSZVswShT8ce2g=;
 b=fGzluOguCXXsI+aMDDFd9/8cYiHn/PVAZwS47KXUckbJ+zR3biCfRw9ikxRBwKPa8B
 X/tjouAcWLnsjqYUk9IlmwieZn7zNkzdRrfRvjyjIreRnt4EI7/mlMgM/IeK1RBWJ4kx
 u/QgGCHGk7fQJMdNnnSrDFxtNujICvcD3+zRZjs0auf2rvRMbCs1WP+IAiKHNAcdQO4L
 GwDFEJkIZpIO4Q3GaMMwBwY0b5fBRC6KHZms3xONKhEh7X8D//6yO8+IYn+I1O7MYMEw
 AdxtPPb5NJFCxp0FIZAv6/SOY9wDaoDkmrR6NcpjgovwZjuv8w+Yi/RTDroNtUwArPs7
 BxEQ==
X-Gm-Message-State: AOAM532V1zF+yZgCm4INuNfeHC07zw5gXy1liDvWKHjz7uFxauJ0zKZi
 mjqtb4ixPmV+36hbYdjJ1t8=
X-Google-Smtp-Source: ABdhPJy1OK90uercdsSGG5Ae3o0Qo/i4GTUPe8bm4EuAq0uwal93ERQZ/MFwHkPnl0udGsTYDoUqSg==
X-Received: by 2002:adf:f141:: with SMTP id y1mr4096811wro.173.1628871721527; 
 Fri, 13 Aug 2021 09:22:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t1sm1925515wma.25.2021.08.13.09.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 09:22:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:53 +0200
Message-ID: <20210813162157.2820913-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_092204_143591_B28A988A 
X-CRM114-Status: UNSURE (   9.53  )
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
Message-ID: <20210813162153.w2cDfLfhO5A2yTDcSPJ6vDX49gsYKr9D6ZMgNyYirDw@z>

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-firmware

for you to fetch changes up to dd00d75007d27677158bf6e64000d2e266035294:

  firmware: tegra: Stop using seq_get_buf() (2021-08-11 12:17:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.15-rc1

This contains a single fix to stop a slight abuse of the seq_buf API.

----------------------------------------------------------------
Christoph Hellwig (1):
      firmware: tegra: Stop using seq_get_buf()

 drivers/firmware/tegra/bpmp-debugfs.c | 58 ++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
