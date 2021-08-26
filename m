Return-Path: <SRS0=ky5b=NR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DF5C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9F660EBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C9F660EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLr/oyadxzptQqCqZB0759AETeWmaZLk2+4Oo4zw+jg=; b=4HS9m02myLLDpK
	mUfse++W8N9gWuAFunzPxGx02M6IIsnRoRLJ5YwjMN0ycIWGW84e1CU/+txwgkUlRWbhlkeUf6PkI
	zbe0e7kkV+wxYYQK0BOUdcMQWSliD7GJzjdoj6N2sumcSgZ2fiZ61FKUYVAtlNT+DH3WW2TnlyjUH
	jZHSTV149besQCfc0Xg9CWnJPJiwbnoI18QBLNqW73wkjXbqfRjFrTXr8HoeYeAe/a8Rwchtvg957
	4WtYsE9xqkOwctMFijVicOMxzy9qjtzv0A/c50IIlbSL1SKy4vmACtOsJ92xAViDlQEI8M3M2mlwP
	zOdDbLPQ9M54P35FlFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJBnn-009gK2-4m; Thu, 26 Aug 2021 09:36:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJBni-009gJE-So
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Aug 2021 09:36:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CADD60232;
 Thu, 26 Aug 2021 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629970558;
 bh=QjrFsi81TOQB1qw5hsx9MkAFmwd+UNyQ8NvyFkjWbDQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aKWNK4WIE5/TTjxoPD0Nkwn7HKojZj4UKoo/oKCIlprx24NzXG0yoZ1YcXLmbrt59
 XMu9RJXarVjDa6NKzuXZ414N8NZ+dQF0U84x3kAyM0Y/IfpKGkRvKkLENXH4kKDIEK
 0iHafoYs8LmR7lUZpsZ13c/2qoBSjBsXMm7+TRfG186WGlu7RasrCd8TMksAkpG1vM
 SMwRDwQsgZ+Avkz/3Y9ctopyxpfyqtSjJpGXhkU1YOSFuA5V9u8iNdMFqvjNBtRaAp
 g9LqT5F+ODuxCTSeQy+RD5HF9D4uCSekwPU+arVquHdH8ggzrXS9p5oUg/pnRP3HK5
 0yIAdb4KfAQvg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx SoC changes for v5.15
Date: Thu, 26 Aug 2021 11:35:54 +0200
Message-ID: <162997054034.837715.8900575474065288793.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5a25f882-103f-4df0-0d90-868d264c900b@monstr.eu>
References: <5a25f882-103f-4df0-0d90-868d264c900b@monstr.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_023559_000767_23E7AFA0 
X-CRM114-Status: UNSURE (   7.78  )
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
Message-ID: <20210826093554.PBPMrzkkwS6YGre0pExJPsCDXU6zLIx78MrOl0JnMY8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Aug 2021 09:31:31 +0200, Michal Simek wrote:
> please pull this one patch to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 79cd0bb66e359f5f9398de9d2e86eac776947691

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
