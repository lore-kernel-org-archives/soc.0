Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DD2C48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46A361357
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46A361357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBDHIdM/XHKG9G9Qc/aBc+ABK52tBmQlwMtMYcjYhxE=; b=DGZru9H+CW8aKd
	75pXhmGKstSCl0VK7wLRkPX8PJ7ilSMp8/Y5w9eUnwecH0TQg5EU8l9YS38zCqStm+xZRAY9fKobH
	JBr4XQl74uT/FUuMMAXLsr0wCLZkEso91IcQche+PQBYdSYsgO0I6GUQglPyJS/oL+QJSKj3Bo/eU
	l1F1OGFy/YgKl02bMd7p1GA1ayi57SBauwL+RE6PGcEyQD8reBu9ju9Vv0VfIEz66Gso3i/doPvRb
	prBgvCLniplZsCdEUhq+5M0XXtMERQ5qIjF0H/ltdsDHHBZ1/tbDdSArU5zzz9gNqmyB+SnZK9RXW
	wPXrPc96ePHbo8mDA6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkFV-0064Bt-JZ; Fri, 11 Jun 2021 16:43:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkFR-0064BD-Ps
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 16:43:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id z8so6751014wrp.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2y1nNc7K+FotKmCLrE2xc9UwhEMOudxdp6Ua/dpxnA=;
 b=QVccNFWGssWk4k4ucBpwS+8fhjUb3TMNJNMl3t5FLIgQYgTmYAo8plKz5H+4I6bdxw
 IavtWULG8FSlydKvTlF5wDV05v+xD0zIIEBNiwTirCs61LpCuoDGUEAOsWTujt2xjzww
 co+cynmZegs1M4ZfA7dNcr7OVbDGxnXydXTbh5mbwDftvvdz9V8nqw1D+uLY7GJE+WmB
 tguux8FWnY87SAfKaKtLIfMIt5RD9JxTuX48qUDwRZDQqY1BZxKNIm06y9SrP5CABZzd
 3ScdNJe4dzNRoKCxM/IKKmcgvyDmbxxOWjd8lnwDWytgSCRcC5+yjQA1jvZ7W8Ngcg3E
 nS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2y1nNc7K+FotKmCLrE2xc9UwhEMOudxdp6Ua/dpxnA=;
 b=h8knNqHb4ObNb5EqugMgCUX8IuFjXt5t5Tp5pqfujolCktl7PozynrGhZdiOujoYRj
 4NrhEqCRoO1KKsFhUOZnkVmkOPl+5KGyZ8blSEd0wmDIXN9lZZv+XbDYeTj6SugRKUBr
 neKc7gASZ704SXDFAuBTdqRmcpTwgt8ZNG/ANhipbgMCz9M7Sk8JG41WeLZVf3w8oQ+J
 OYafkPHwL85IYowjFmDPOE4CUgS2NZikuqLDry3y7tuPVhMuAQZDg5rEiCqItX1K51uM
 a4nuEDvF+ghavWwPZibdJf0z3QgitKvL1sUC63uJT3h91hlretMfoNL12rOtNdttM1m8
 OSMA==
X-Gm-Message-State: AOAM533sasg2zRfAXCYtZScVqvES3uUN+h6E2Z1GmtVGksktjoQfKyMq
 O2tjErmugGNw5me1i+ioW5A=
X-Google-Smtp-Source: ABdhPJxbh57z+wnedcBu6pjDDzsjRrMwjs2/RmVYmEKbEpOZMiesm6jZOqpG7ISItY/7hqRhGOo4mg==
X-Received: by 2002:adf:a195:: with SMTP id u21mr4993145wru.367.1623429788401; 
 Fri, 11 Jun 2021 09:43:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k8sm7725414wrp.3.2021.06.11.09.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:43:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:34 +0200
Message-ID: <20210611164437.3568059-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094309_859267_87F44050 
X-CRM114-Status: GOOD (  10.85  )
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
Message-ID: <20210611164434.uFENsMStfS0JSuy5nAxzIVQKAW-zXiQp02Lrie11p9k@z>

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-firmware

for you to fetch changes up to bd778b893963d67d7eb01f49d84ffcd3eaf229dd:

  firmware: tegra: bpmp: Fix Tegra234-only builds (2021-06-11 13:31:51 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.14-rc1

These changes contain two minor fixes for the Tegra BPMP driver.

----------------------------------------------------------------
Thierry Reding (1):
      firmware: tegra: bpmp: Fix Tegra234-only builds

Zhen Lei (1):
      firmware: tegra: Fix error return code in tegra210_bpmp_init()

 drivers/firmware/tegra/Makefile        | 1 +
 drivers/firmware/tegra/bpmp-private.h  | 3 ++-
 drivers/firmware/tegra/bpmp-tegra210.c | 2 +-
 drivers/firmware/tegra/bpmp.c          | 3 ++-
 4 files changed, 6 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
