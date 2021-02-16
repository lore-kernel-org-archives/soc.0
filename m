Return-Path: <SRS0=Ntjy=HS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A92AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Feb 2021 11:47:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978B264DA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Feb 2021 11:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978B264DA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQjndWO47ILZq7EBtZV7aahAZkBuHzDhkoYPKwsLOkc=; b=ol5r3De6gMsl0ppNcFy2Dtaj15
	9bBd7ddqcahMc6bkkN2fRGDgQF8ZpVHCi5GyulVkA3sKhX+N9Zou668MLq3f6XlCNVv+t+WzbTqfF
	MAqtl/sNypwncCZQG3PRNWpKyFy0wKN6XCh7yj51j/ifpLQIkctSFNRQdTBeyXYaMB6xuM7kEhTNW
	xLYIheeu4CcwBRVC5qlsoR9GOucvCPUvHzqNqeKx1bXaPcJdCN5iucz6ddirrDW3L8e9cXZffUdIl
	OSdloBBKrIvKMM0JcfPQlNOgi6bZGOr53U2H6HbxuSJ0xRdTF0cjwm2oV8daqEHM/psoqjDEu6hxJ
	jlORVgoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lByn9-0007Se-Pm; Tue, 16 Feb 2021 11:45:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lByn6-0007Rb-01
 for linux-arm-kernel@lists.infradead.org; Tue, 16 Feb 2021 11:45:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C76E64D9F
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 16 Feb 2021 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613475915;
 bh=/kzaja8DNSe1SHWnI5GP+tpsJt5X++V0e1zEjcYTwGw=;
 h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
 b=r4CThgpg1U5TVrh76eVAviuAnN0y9GyGB+BQv396ictCe1W/vrH16I8mA3BmyJjv8
 WyJhRsaYt9qiMwZ3zwOH3GxpyJTY6F7btTI86a/kmT15gH8Js65d62sNLuQ5VLnhcc
 +AGPgqLYPPNv2ak1RIT8Tuc2MZSgGpn8vbu+HizwGfKZ0DahZQuJbablN0ZUfbug8Q
 x5azADs8qh5/u9NMZJfTSfpEG1+srToRhmhfMecURyBovIaTV79dr6IMjTzwc3/6YC
 i8qzeB2Zzmzul81aXuUrgJhUnDWv9Z++C7qaP18ik7Y7/etv2l1MwZsgaAmldyt2f+
 uZafzPz29bOVA==
Received: by mail-ot1-f48.google.com with SMTP id e5so8703111otb.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 16 Feb 2021 03:45:15 -0800 (PST)
X-Gm-Message-State: AOAM533iSyzkYJIuAIB+v2ozwK+UgEb319/vY270vpvFRw88PAz3WaSZ
 vjmHdKDoqfRNgvcN5ksWrp1MYPMjmfIVkCyZqMw=
X-Google-Smtp-Source: ABdhPJzTNFu6FIQuOIpauhGHN7g8rlWHJ4iRSBz9NymNB3CrWpN9HichPI55VgDXhRC7uRzrmE8C5iAPY3NR3Clza4s=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr14361372otb.305.1613475914444; 
 Tue, 16 Feb 2021 03:45:14 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
In-Reply-To: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 16 Feb 2021 12:44:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0cZZna6SrrWkHr9w_=_JgiOhzu4ZMS7TA06jMdGEoByg@mail.gmail.com>
Message-ID: <CAK8P3a0cZZna6SrrWkHr9w_=_JgiOhzu4ZMS7TA06jMdGEoByg@mail.gmail.com>
Subject: Re: [GIT PULL 5/6] ARM SoC devicetree updates for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_064516_152559_38F9F6BC 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210216114458.nvrMpqoKtlxqVmIODT2oBDdIKzL7UgDIpcBFhMxaKIk@z>

On Sun, Feb 14, 2021 at 11:45 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Broadcom:
>  - BCM4906/BCM4908 networking chip
>  - Netgear R8000P router (BCM5906)

Two corrections here, for anyone picking up the description:

- BCM4908 support was already merged in 5.11, BCM4906 is what is new here,
  but there are very few differences so it's almost not newsworthy

- BCM5906 was just a typo, this was meant to be BCM4906.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
