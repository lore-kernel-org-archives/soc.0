Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C022C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 13:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA5860F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 13:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DA5860F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8vvF3p1MkrFiFfMagLGSmpF86B/HdeyhbzL5j31r6M=; b=HyCaPVJL9yPCHu
	KaMchxY6fx1Az0raxpDu2kYN3X7bOXW+aIC9HVTLkABStIeXUpFCtJMWDqzTigL750hQKh1hhIk7l
	tPeWnlnMiYzpsIngzm1lXVUyR5QgpfGkuR+AUhpKxYfMmHeOFB7GqakMFBZI406i631emAc8zk8VD
	UvctipO0elYnCKp/TDHKOAthT1omivyfjMwjeLhp/k+5P4jr4V26IMPgA9RQ/VH2tZWuGZ1SusWeU
	E3udc6nmNSiayE80U2KFk2zz0c60cO8aEtqht71YrZH1wxWaKkhfc6GMs5YHtzKExZangI6TEhHeS
	FrZFldQvf5SLE6yhm31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdBgj-004c8u-E3; Wed, 20 Oct 2021 13:31:25 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdBgf-004c7j-4E
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 13:31:22 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MCKJw-1mUyD02e6U-009Pvk for <linux-arm-kernel@lists.infradead.org>; Wed,
 20 Oct 2021 15:31:16 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 b15-20020a1c800f000000b0030d60716239so1708893wmd.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 06:31:16 -0700 (PDT)
X-Gm-Message-State: AOAM532nlVuq16OU2z8TT2fbovIz5BoOKYvnuSht0/CUAk3yte8fOoJo
 CXbR2RXYbuspJNzk11Gi2p+g9XRLTAmZ2a3HWKo=
X-Google-Smtp-Source: ABdhPJxKVpH5wqYslRICglnTTCwvnfIARjkCHAfultNMD0mtol7UBcncx8Fq5w3uXSIA3llnjypoIoGL1Bhg8ZDtKwY=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr3065306wrq.411.1634736676095; 
 Wed, 20 Oct 2021 06:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211018095848.19101-1-romain.perier@gmail.com>
In-Reply-To: <20211018095848.19101-1-romain.perier@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Oct 2021 15:30:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
Message-ID: <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.16
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Palmer <daniel@0x0f.com>
X-Provags-ID: V03:K1:ddKImWMj8UIa036RYbHQGT43suaQ4TCK5P0mbKqt5qWSjV/F8xX
 PeRxn1RBjPa02S9pZ3z6wi6Jr2kjJnL1y/k6ojJYPEbQXbLBOsmHN5+eZd3R42V+qqo3gxD
 GazURSwHiknNynlVHuB4dZlPUKPm2jyiCSsanXm0X4CRUzkUJH78vFZ99MfOFr9CjKtdnJc
 SWItWkOcIwq8E3mRPooeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:smaEWsg7REk=:WulWqeSzCXTdoPB2b/fmfv
 pmSbQ+tIjgMYhnQmC1C0fZX8i5V3fud3jN0wNTU/EIIBXcMOTfQr4YzCOsa/gDasDR5nb1Lbb
 c+/uq+B4V1EU3J+t7EsxGtTrxmUKDwv78cCxup1jzcpWtc8/OqgEneJhOki1p+aGNm2SX1IQU
 4wAsUE9relzZpXn6HTolKqCsyXoS6B4hvANUrVx1kkJYvZLcgwXAgh1Di3saa44f+DsqTRBsp
 J7mmc3l65sSC//tAY/RC3HAq9v0NJjED+LU2f94DBC7Xg+8MZVyHwzX+2C7EgJA8CK4eZd+ak
 OXGuShQ2BFV3NR2bQ47bxAEMLFO155cDOJXn3fHOa7L/4pRT5qybNXdk2cwONfb/yLv64+pxu
 Jp5Adf40FaxUTgKSIIMkwGWy+yX1JtQyVziRBf80QkriCFmxh3edOjnc6Ux5NiZNBKVycGIQo
 0tLpsaiawgR+2cw/p/tjp9ta/szkVET9/85VqrBLrbSh6HYCcx1LaU7kCb4mYJHjttYvBvhcq
 ft3fatpGkwPlw3H2umvUogkUDy0RrbRAm4krG6NgyE0F3YvtA7Jj2BKWdPVEz2/VxQNebxhlB
 uhzX9Zyd7+gdQuZbVjgv8/XOzVIpPrqgV0cuIVQWq7vUQC5FC1UfAqfsZk1lADzjD2pVdH2Pk
 TtR9oWmuxWX0D7lYQE38cBuuTWfhUquwupLYTmId6Z45BK4O9VPsjXwrRKqmNjRM68tQoh22m
 bZqIWlXBwtXcwyoKduNzAxWQ78m4Q8fzw/oStA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_063121_506160_4EF19A31 
X-CRM114-Status: GOOD (  11.97  )
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
Message-ID: <20211020133059.dXHFNnNGiFlwPoXb4CHNQACFhjobYDSIRL9p_Fijvm8@z>

On Mon, Oct 18, 2021 at 11:58 AM Romain Perier <romain.perier@gmail.com> wrote:
>
> The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:
>
>   Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/linux-chenxing/linux.git mstar-dt-next
>
> for you to fetch changes up to 7e626b6d71e7678e85e9e06e9e2271b5923741fd:

The contents are ok, but you have based the tree on -rc5, which would require
me to backmerge the new upstream contents into my branch and mess up the
git history.

Please rebase on top of v5.15-rc1 and resend.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
