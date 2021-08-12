Return-Path: <SRS0=UjyX=ND=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A47C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8724660E52
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8724660E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=th9n31xf7Dxn2Gq6Iv9hz60cIqI6pd2R1TM6rpfJZPE=; b=h8xbzxLHM9vdB9
	xrrQW0S2WjGmrs4XcX8jJvmloOxiF/UuYm6oyKSwEvL+17fvzxPCuu6d0hMpap0qAxWEYdKLbdb1O
	Tflk0lUjTWnGEKRVB91FsWK9LpFbUj+6eqMbyeJNBMn2rPFVCQqIQvLMM6ko6s7q0B/wua10/jeJE
	lhMudzfMaSBPnnnaUczVgTOuhrOezAGE/LQ2jHiX6U8FmVs6kFphy4UT17xi8GcrEl48HXU1hldzX
	gm5de2rCDOaGcuHq1KJcmn4a6duKHirf0QC1jKzOqaI8nuHNe4MEly9BImNYrDXW6YCRFi//+ZKGa
	byA4ZQ5S1U6t1g0fsXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHv9-00BJrL-Br; Thu, 12 Aug 2021 21:07:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtr-00BJVs-Ci; Thu, 12 Aug 2021 21:06:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8DED60F35;
 Thu, 12 Aug 2021 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802363;
 bh=pkXOgIRcW89Zl6g1NvmK11lBL6o7RAVcZfC+Lnjd7zA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uGYQjvpR4JF4JQR/zjzgpgyX6Xe+p1B0OfNB/itx0ccRXj0psKELhQw+pug3nItIG
 ab39ljw9fDAVCS+JtsK1kFSISZfNLUbXsfKJJDCYEvInSpQXHu+y+VqVmEdIAu7RNg
 gzJAr9p07+K5P+uWpo4xeCAVfnXJTI92HqsYO8E0NBFdkoVdbQeeazrK2VAvgGFSFh
 ZIGYJ2j+5OVvdIyhzSiosTYEF8ljVlMc3Yo2Nn4+GqTIQ6IlNyqImNMlo4BDwEurVy
 lKrx6s8JrGZYUVOBAvLKQgl8DlvondmwcsxB9+gannGd53ElJ+0zBGo10gPtsjWIui
 fYQR6wrWHfZvw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, arm@kernel.org, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.15
Date: Thu, 12 Aug 2021 23:05:41 +0200
Message-ID: <162880206156.1376011.2609050470436484899.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <032895d9-62b6-6c9e-b04b-9c3d316f27ec@baylibre.com>
References: <032895d9-62b6-6c9e-b04b-9c3d316f27ec@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140603_521118_7E214AA3 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210812210541.rVd_nNhxgO1kttzOAc6BjqGrLSyNtPSjPPD6JAKhXgQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 09:44:35 +0200, Neil Armstrong wrote:
> Here's the ARM64 DT changes for v5.15:
> - nanoki-k2: enable bluetooth
> - khadas vim & vim2: improve wifi
> 
> Neil
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bcbe4bd39d47bc75c8842477d6f577977d526045

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
