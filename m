Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93341C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:06:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36395610FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36395610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k8l9GEM5zerna3+/WLq6nj0azozoXq2tKhIkQPbz5pY=; b=jWE6uRrZngFXRfUyJe7uBHbap
	vP7zt65jQghZHMBLK2c74+Kbx0A0OCZNIzhUu7WuumFokPUyQWvQ5UFRveD8w2YVGnhvmg9MsBnrr
	VJlpB5987KWk2fygBK+1UPCMXalPva4tYnR/fvu/YvbkebLGE85v6xXILbe48f/NFJAM7qt991GRC
	xxzMzWiVzfM2AxLI3iaw7KEpHMAH/0iLzJC61y7Ebw30+5+Oe1mHWBxFxtrz8spLyONBF99neHUyV
	4XZPiZjEq8c4yTbjx5VLDy1zbq4fFU7U7mDT/UDd1Y7J2HFKqdkDZB3jRG7qa181QVbeAAYNO9aQa
	JbQSIIztA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUasz-0099bg-0u; Thu, 08 Apr 2021 20:04:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUasq-0099Zz-KW
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:04:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F67760FF3;
 Thu,  8 Apr 2021 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912247;
 bh=rcKN5yldNAxejhRQZhc4YXYKEmOYpJwJphmoRcDbirE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pT80TH38nr+H7toA4cLZ91LC1Tk+VynJjVP7HCABS18DGacVl/jvvft/+Oqnq7lxw
 eqIi48xzp52h2hqhfJgnQqbrKTk8/v5+j1QPL1IkOfqIccOXp1jiIdJ9uxE4XZHVVj
 /WLK0hjpk+ruzGV5YNfl7GnadJPdOR+OLKUj8pLMefQ+R1Lmb7+zEZPutp1vSDm9Lh
 91H2okaU8gYkbH+Ysy0yUjlFrTszVVHo3gpgjmqsY6uSgAzn6GBPLhcekxhbHmlGpw
 t4yP/Zcv+ephbmafcv95/jIpjNDq9THEBeHZAwNML6wAdLm8LN9XvX2JPa70tdYeDJ
 6UiqKUmKFKi4g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: Re: [GIT PULL 1/3]
Date: Thu,  8 Apr 2021 22:03:33 +0200
Message-ID: <161791219767.1659621.8262556060310725064.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_210408_993388_65EEBCE7 
X-CRM114-Status: UNSURE (   6.30  )
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
Message-ID: <20210408200333.tyrdPeoO8U6FY9MwRK9pFhytQ7kb1HpBZZl42ZMvCiw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 13:10:58 +0300, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: f47e8e14373a731ab4fbd08615b2694ce1fc5142

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
