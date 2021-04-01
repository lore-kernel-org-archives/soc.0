Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4B2C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A6E610A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A6E610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tUAF7dNSqFEhe7I3g1xoVkITnq3k9V75hT84mhkXNCM=; b=HO4gwT9saMesCJVDiY1FOOCTB
	sGYzToU0ozWzl4fV7Qp2JuNl1VE1gdvl808y2jBMktBnx/wUhKX7Qlq+B9+2NWAkaidob49usHxtR
	90+V5RGKqYktG5J9E9y+ij4KIn5eBWMJ+/t1hlB1u7pp1u8xQYItrOnPaqEfDp2+3qUm7eIySMIiH
	p2PawiIFGdUeJj0Pm9tUDdbV+qSv4qLACm69eJf7LW8uRHdFfMq3sHhJO3SA7rlBc0CDJ2hYw0m/f
	XNI5OvX6wdOgodyNwPVnP+hmyodHNarqRs9X9jSfY0Op/sRiW+hzgsTTE6pjpvlV8aW7geTEU7sLs
	tJSmMg5fA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS37M-00Anzk-Mm; Thu, 01 Apr 2021 19:36:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2vo-00Am9f-KE
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 19:26:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEFFD610D0;
 Thu,  1 Apr 2021 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617305079;
 bh=nmaf73T1V9OZ4POKVDjbnFqaUT1F4D2vEE1SzTsNTNU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MlDRLtv+xxaHlvFCUGA3N67VjLzKmXOI4jbs8tL2QmWmIhBv7KbXIYNm8wyY1fWXJ
 VCBRS/t7dkvAGfERjy07nOjy++/I845452sMz+iky8odUI7pd4XPxfvD3kHeQrPPSG
 b/kkWmDN+ZdswBA6sg3eDYCgLqQod2zpotpxE6G6Aup/LI0T0LS7LBvHYcZxQSbz95
 9rFz36bfoIc+8cw452IHOhOF+VhVDVQXYtjysXfYAludpBLqU59HF2EWlKhzwp2+D2
 vjWHbt2vZqNxVHNfLVIsIByHkLcy4MVTLRxhs/GxkB5QA9f1ovfL3htaQuRKfQoAhq
 FIteeIXj19dkg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/5] soc/tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 21:24:17 +0200
Message-ID: <161730504520.632809.18138273991245281834.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-3-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-3-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_202628_876600_BF27872F 
X-CRM114-Status: UNSURE (   6.57  )
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
Message-ID: <20210401192417.ry2QXuIAhDyvYoZzKMezq1M1G8y_yFJJt3Zo8crfmWc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:20 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-soc
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 66f3431a87339f332a2ca674e9fbca48a6014f89

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
