Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281DEC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:38:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C565023A84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C565023A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tVXmCt2iVItYHKtGBkkqp278x+qbrVOmvI2b3O2TW0o=; b=AMI6HsuodYrjvVPNrHa6NV538
	KwWbXxHJfcyBxbkQE73J2yxNmBGa/NEnpk6QbHcSjNTLHaQx/d8n3Gb7C9TDqxesvUGO4tiorNq7w
	CWvCOsfEFquGlfc7ZtopJLPHlsI++wItBV3tvQutQeTq6D2ND7EVCeDdQe5NoAIuy34ssMpnRNpI5
	J0ytLO43Yu3Y4pwVGF7TFpO6EsQNCZISUb5d1sKerJZE3b2apNqxI6FfoJpHljuwM2QHcQRWQADmn
	eecKUul5cmkqaiMJRqbCNpa7iiZwxkGE8FLoaoX1IZ7aPSnR7LnIemo+mNPnlYSEM7W7ZKa/3J/yx
	YuxWJdkiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l352z-0001ME-2J; Fri, 22 Jan 2021 22:36:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l352v-0001Lq-J6
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:36:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D33123AC0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355008;
 bh=wrK/0ETSQ+v0wfDnWxn52L0z5V+fXZrnD/rouv/QDMU=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=QH/Qc3M8rYgB/3BAJbCLqe+9lgrGm6YxlkcWaYyuZKrDvs8FZb1U4prDVx94LrxGA
 ym5a9OCVm1iUHO8etbqsz8Gpqh3izzDP8HsvMxPSuEXk84MdWhUuYUsodj1i6IWsHI
 fnNrIJGU5TzqkNWo9b2+TqSr+/BlQjXtVdEAbMVOD/4NqC13lkTXe71lWPgeg6Rrm9
 cWXXhCY1i/zQP7qfoOJwZNRFG3r8F/m/UdLf6RFRExXhcXlfefDxD9EYJCcWzEn+0z
 SUhO6u4f3v5Zz4MVSv/H+huZNGefnI7L5FsUhOci+j4n82jqS1ek2HVuZHKklrC4Y3
 0UtUxb8X1eM2g==
Received: by mail-ot1-f52.google.com with SMTP id k8so6684879otr.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 14:36:48 -0800 (PST)
X-Gm-Message-State: AOAM530w7Lo00U2lH+7Igkvl8UoP7YvD5cQL9U6zEj8Uv3JmR8jGGOY5
 NOR9O4HjXd2EcW/vmqvmuEx+XRVMp6AYYHH95aw=
X-Google-Smtp-Source: ABdhPJw+4Fx9Lkrjt5v2yQSmOgCQTIjMyQ8+jsbolOlM2Lg66jQPT6z2Gks+njmIa+g2sHAuOx5+6FFPrzUOXv7ccO4=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr5076613otc.251.1611355007653; 
 Fri, 22 Jan 2021 14:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
 <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
 <20210122163520.GG1196852@piout.net>
 <7131cfc0-2519-8bbe-a380-609eced61753@microchip.com>
In-Reply-To: <7131cfc0-2519-8bbe-a380-609eced61753@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 23:36:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com>
Message-ID: <CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Nicolas Ferre <nicolas.ferre@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_173649_706626_D4FB3D0A 
X-CRM114-Status: GOOD (  17.85  )
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
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel list <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122223631.hy6bAcm33W9LNk8WE1_AwNHfnh_cRw5UxJ_uV27TyPw@z>

On Fri, Jan 22, 2021 at 6:05 PM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 22/01/2021 at 17:35, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > I wouldn't backport it as a fix, this is just a warning, in a
> > configuration that is very unlikely to be used (and honestly, I
> > wouldn't enable this driver on any platform).
> >
> > If you take it as a fix, you'll have to also get
> > https://lore.kernel.org/linux-arm-kernel/1611318097-8970-5-git-send-email-claudiu.beznea@microchip.com/
>
> Arnd, Alexandre,
>
> Whatever you prefer is fine with me. As I'm not the first impacted I
> wouldn't push in one direction or another.

I've applied both patches to the fixes branch now. While it's only
a harmless warning, it is one that would show up for anyone that
runs a kernel with this driver built-in on a different machine, and
this could be fairly annoying.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
