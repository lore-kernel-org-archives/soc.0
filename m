Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CC5C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C22261040
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C22261040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQW8Jid+PKPk4m+11nQFaoZLqLPVCgjLgLg7qEUYHG4=; b=s6NfLbAcdUZN1c
	nqXfBFG7lLLabhsFmyf5TmpSie5av2ABb/gWwtgfL3LucmZKfSg8nuwzEKQgPOFlzhi46ZbrlTq+A
	q5uImM/jzzMp/TVGxWSsszWhhyQEoEetMD5kQ6/mmVtY3hpYMJHnDk9yj1caoKt+4yN23cR16JW11
	1V84viDYH8RgY8RDu62JGXwFhg8SigZPEHudtnhVa+Q6CGafshT5B7dwg/l6fVU3iDWAMsxl838bC
	nzV2KmzIpi19MPAxRw0LD8pNhwqjaJZjbHG1E+FFKO/pug5pa0VIUToRityI3nM9x/W2AeNdGiI7x
	QwcxFrg2iP/hL+Oi09WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwEB-0042rg-5e; Fri, 08 Oct 2021 20:12:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDX-0042iM-EQ
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id v25so33010727wra.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6coWZ7sMS8/cnYc4yrmrrCkk64EbPdSf+pzLA8E51A=;
 b=IqPhVpTHqsTU+BKEpiOq4SqR7eH28X0HUfiFkPXDXgwQc/rBHq4AUxlI7zJwfEb9Km
 4/F6vSgIa6f1U00Iz8KLxcC9T3c+wD6BMzUpwfID29Vd0Mj3I3kgceoTlBmy/3QyJ4YG
 pO2p+9+CFeGIqXWd7LGDZl6GHQzT2d12iUROXXZCmwA0btugMBgIeoSLtaoYh5jFfwZ8
 jVXHhXUY9Yq5+jfoJLk9hyaiEROo0iXUPQk8niUX43lqz/enp8qnGCybIwhVLBjPBv35
 /60OGetlDcO7Txg5yiCNmUsFd25JqjdDwDOfEF1wlAtDXAb7onBi1LNSZAe01KL9NbW7
 WRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6coWZ7sMS8/cnYc4yrmrrCkk64EbPdSf+pzLA8E51A=;
 b=eHH1oJsqx6Nc8Bngry8j+6wQde5xIcSY0l8cmXUOT4pF5+mkQizjmyORENUEtNPr+w
 V+CVvkhVhVrvD5ASm+TpI3NB0yNM6uXdyhcdTfYML+QCWP8jn9JkPZRfx9NJGh9RdTUY
 X2L1IVTB0v0ZAfW0Ti8fQ9AbNCCSzEg+xh2i/3rcMtR5VLzgM433FPrypVOVa0wqElI/
 9F79Pzrt2j/+j2EYU+i0tSdV550pPzUsrH0T/WzEMDlKks/X3MfPVwVARH4UZ7Sl82oJ
 koFjLWqPjfA82Bp0Gf74+jDV2qPKvYtxlXTPJ9LJnHSNbHKMmhMr/NIvEuS+3AQYmLHp
 abeQ==
X-Gm-Message-State: AOAM5301sHCBmtHhfpfyP3xW7o+5vhfObYB4NYFsP1qCTbWtTJqRjDBs
 YDCU3qASSblc8mfjuwbsZPSF/uWCwFQ=
X-Google-Smtp-Source: ABdhPJzVbW3ng2xhAjX1HA9rXvPa/cMP6LypEzqShOYN23bF47ZPoQO9I9yNR6Zau8N7dS/b+z2lyQ==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr6623943wrc.231.1633723901801; 
 Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id x17sm301964wrc.51.2021.10.08.13.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] cpuidle: tegra: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:29 +0200
Message-ID: <20211008201132.1678814-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131143_515371_1681050C 
X-CRM114-Status: GOOD (  11.32  )
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
Message-ID: <20211008201129.jJXyLDWvqS5wBrap4A1mXYYjbaniminwWFvD8TrH6qk@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-cpuidle

for you to fetch changes up to bdb1ffdad3b73e4d0538098fc02e2ea87a6b27cd:

  cpuidle: tegra: Check whether PMC is ready (2021-10-05 19:11:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
cpuidle: tegra: Changes for v5.16-rc1

This pulls in the for-5.16/clk and for-5.16/soc branches and uses the
stubs added in them to enable compile testing of the cpuidle driver.
While at it, this also fixes a potential driver probe order race
condition between the PMC and the cpuidle driver.

----------------------------------------------------------------
Dmitry Osipenko (5):
      soc/tegra: fuse: Add stubs needed for compile testing
      soc/tegra: irq: Add stubs needed for compile testing
      soc/tegra: pm: Make stubs usable for compile testing
      cpuidle: tegra: Enable compile testing
      cpuidle: tegra: Check whether PMC is ready

Thierry Reding (3):
      clk: tegra: Add stubs needed for compile testing
      Merge branch 'for-5.16/clk' into for-5.16/cpuidle
      Merge branch 'for-5.16/soc' into for-5.16/cpuidle

 drivers/cpuidle/Kconfig.arm     |  2 +-
 drivers/cpuidle/cpuidle-tegra.c |  3 +++
 include/linux/clk/tegra.h       | 24 +++++++++++++++++++++++-
 include/soc/tegra/fuse.h        | 31 ++++++++++++++++++++++++++-----
 include/soc/tegra/irq.h         |  9 ++++++++-
 include/soc/tegra/pm.h          |  2 +-
 6 files changed, 62 insertions(+), 9 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
