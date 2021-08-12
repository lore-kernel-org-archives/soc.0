Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A8DC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEEF610A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBEEF610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2lFDIUwIaI1YkdBEIhhzwhGN5P+z7SLelrfkOBIBwc=; b=05tEkfYTnZ4i+k
	NnSWm2LHKecLrEWPH/09ZCsI4Lmxjc2saYWEKbv5br9zcLhn8iQK7mCXJB/v2tmXCaa5ZwYJJJTp9
	nvJRs5T6Bqi25vfmzc5AgwVmQQwEHjpr5/niGYrmQdWHDc2fz7V8RgzV9kBY7Uf5iZ2DxQkU3vd+i
	3UOgY770CAypPXjFc76asFhcplYPgVlI5PTVTqnz57NfGsxIrwujkx1mdKWxliDup1WFQMhnVY9fK
	JbQxmZjueuhRNWDHLXeR4PnuhB2kHMwd8r3HGeR9tAcOedAgNtJe13qC5Y8SmVWi26TeeswcAG6SP
	1Eh3ntCl3exUaP80zRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHWQ-00BBNt-OK; Thu, 12 Aug 2021 20:41:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHWE-00BBMz-7K
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:41:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75EB610CC;
 Thu, 12 Aug 2021 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628800897;
 bh=cJyXiGxDGd19j4fvK/Z4623n6+xnaPBmWOmIkcMEwL0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F+A0Gidt/DlYDu85LxK7Evz5kVnJSaTFsXLrLB0L6oD8cCtA9mkBzQLayaUCgj9yS
 YXFBQ+m6JonGgOpigrL/s9o6mMmSZTAJDVPRL57Zenr1sR7Ihh8HuAbn8DtctzodM+
 KKY7v8VqVekcpH5id99ylFaF7hcy/06zyzkxQvw1PeQJ/6Ng3Q8+4ZLv9Lv6tuHU8q
 2DWQfnUfa8NDp6rVdalApRHAD28fvprHttLx4yHzf2mRTHnA3AVAyrlB2uNkuMtOSQ
 5JtkRwXz4MmwFFrcGNM74RZ1qnVVD4sQTOP6GckZnufu+VneDbuYmeNJcKIuGF8ZB3
 LPr9774oYtdgA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL 1/3] Two missed omap Kconfig patches for v5.15
Date: Thu, 12 Aug 2021 22:41:31 +0200
Message-ID: <162880088346.1372369.540207205848005898.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628751694-126144@atomide.com>
References: <pull-1628751694-126144@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134138_320557_4047ECBC 
X-CRM114-Status: UNSURE (   6.83  )
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
Message-ID: <20210812204131.uM2j55qGOC4HOxV2bWFv49tT-RepgMnWb919sy7RppM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 12 Aug 2021 10:03:42 +0300, Tony Lindgren wrote:
> The following changes since commit 8d5a937f10ed091e14fc57a4158f59983e2934cf:
> 
>   MAINTAINERS: Adopt SanCloud dts files as supported (2021-07-27 11:54:52 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/soc-late-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: e694952772a7df091a6cffe828409843f53c9822

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
