Return-Path: <SRS0=0nsL=JR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205DBC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Apr 2021 10:22:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECC0611C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Apr 2021 10:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ECC0611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Xcno8OsHefwl+ZQM8WerFjprj9GQ70Tv+Tnaq3oUzs=; b=hoyPoH43OAPm9cLltMd45o7K8
	PULfvCKGm3GYQsgg6SAWgryOzkY6iGxxSinecJcqVGtCF090cwxtni4pceqQA6LsMkbmn+rLloJtT
	a29Q+bfqzvHnvrIaKy1OFPOLRczCIQvIW5bfkMvapVf/QCguqF/P1g4IKRu2xzTqaJ9i0OPj1kfJP
	qcpqIgSnuOWU0swd7/uagG7bzoIoDG4hP7392ZNnQIq7piHGw+w6hKjS13gdr/R9JcSRIah6GmPNM
	SmubeCFOAZm32aJ5igLTte2iUBPCjLiZwGcozNVF0YAXL+33eAhkYnDQ769qghGA+lQ13tqI9bY6g
	muZTssnOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYnSr-00Brfg-14; Tue, 20 Apr 2021 10:18:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYnSp-00BrfV-AX
 for linux-arm-kernel@desiato.infradead.org; Tue, 20 Apr 2021 10:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9BM2Z060f9/SjlGJjPAgJqawT8jX5/066DCbuWqaW0M=; b=3a/2tZfajfZPXAqvsM8+ubgZ/4
 YD2hgmMh/3ItiV0VEY+8n10CZOi3nsr2H2R1CqXFu+tXvFEA3G7NzU94cMf4z6l8dUvWAuBn/5flB
 GxwE9wl+UJKW4ZmSxmI6tQzDugPagMe3GXApPzyKczfH5pHv0aN9p4hICuspS5VHrqhj0EHGX1GNN
 dzQQwEMikEcG30aiWirSU+e7+ptzG29rw4Jq2HtRaKigcGaVf2bjHyyXLuA0Btf5jvcoFK1JyIBn/
 pRO/fDXHchpdSOfbRD1t7jFDe9PdugZKIQKEDI6y84pIyTG5xBKMW0rHKtquRdHb9MQUEOiWnw2NP
 D519oMzg==;
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYnSl-00C10g-1Y
 for linux-arm-kernel@lists.infradead.org; Tue, 20 Apr 2021 10:18:37 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MyKU6-1lidly2jkK-00ykOp for <linux-arm-kernel@lists.infradead.org>; Tue,
 20 Apr 2021 12:18:30 +0200
Received: by mail-wr1-f50.google.com with SMTP id m9so24262701wrx.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 20 Apr 2021 03:18:30 -0700 (PDT)
X-Gm-Message-State: AOAM530Uq2Ws7/j0rjd0Hwr2JMNjbLyFD7nCAYrOuRq3Rha9V0Uyy6fU
 ggQFsX1kbvA1v0sYet9SlqwtBa0T44+CF28scvs=
X-Google-Smtp-Source: ABdhPJyUDsDPQ/TzUO8hSAxeXP/7fjRSZkp95zkMD5TB1W8OuX2Qb7o1zHiTDoK9iL0zdA6C2BM7nWmTaVrP5+w7sgI=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr20452851wri.361.1618913910297; 
 Tue, 20 Apr 2021 03:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
 <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
 <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
In-Reply-To: <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 12:18:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0OJhjF4R1zCm0jD_MUiS8TeDR2x9wTsTC5Apr5Mq_fSg@mail.gmail.com>
Message-ID: <CAK8P3a0OJhjF4R1zCm0jD_MUiS8TeDR2x9wTsTC5Apr5Mq_fSg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>
X-Provags-ID: V03:K1:sSqc7vA+5WaEH0CgZxBn5OnK6vMTd9ZhxSQyiTC7lcgi6u/tvvW
 azhxEXx98ouclG8bbvkwPgZ1Jqx1+t3afTH2r/SABrgSMrXbJfGM13it5Mc+vNkrORQWA5C
 CI8l9EM7hB/wlFh/3mDGmcFionmIC3+rZSgpdm/6eKEvQop1NzMSqLaFbZWwKV4A0XtaquA
 MAGpmOzogveDN+3ilPrFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sUYJ+9xHWKs=:6PLrDhJ3YlxKyQIdedX/ii
 ScC56hiKcK/vX9lBB8C+p6ju/WtxR2oC3GB0MGHN2JKCG/iDVzbb/Lg050RkysG1ExSYqZA6h
 bB0oqKOK1L7Swq2pFcGbW4yoYpjAerszJonjCr0HV0If2UhGOfuDmD5x55fbai4omIAUAdt5n
 s7dbZ70OmiyeQ6X9lxJ+1nhyliNcvqWO7Yh3ZKqxudkVepNdgtkvb136Hn2D4ix4nDN5xbEQL
 Tr+VC5k9bAYr+wNVLSep90gatOMYup0jQ8+F1wTAeLvwbgFgS/RtjGWSsne25FF/WMkh1LYKy
 DDBCQ21gzEq5UeVtyO+KnjmOcEoFqjInLFx99BdItcc8PDbj7lVRYmfvpfipzaYBvHMfESwXY
 8hoe4TqT8tYqv7aBt4ZUIJmATP/3OspO94Xyad/39Dlq7eBoWmz64X2bY7DzHA7bhGDLjY6o6
 BP9yO4Kmo9uRx1dgZb8YdWuiyjtwvnZcUPSg522uS3eqg2nke0JKqNxgQe1QOoBRN8KIysKvF
 a1l5hEQPxFLycdzZOGKBzE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_031835_399092_647A2572 
X-CRM114-Status: GOOD (  28.01  )
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
Message-ID: <20210420101814.PkdyFIBMFnCEB1mK9tqQfqmPuxwz6Q_YLSX5UvkqnCg@z>

On Tue, Apr 20, 2021 at 9:11 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 19 Apr 2021 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Hello Soc maintainers,
> > >
> > > Here are some fixes for the changes that have already been merged for v5.13.
> > >
> > > I also merged some changes that came in later. If you would prefer to
> > > not take them then I can send a pull with just the fixes.
> > >
> > > The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> > >
> > > for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> >
> > Hi Joel,
> >
> > something about this pull request doesn't add up, and 'b4' refuses
> > to pull it since the 'since commit f0145db2' and 'up to f0145db2'
> > references refer to the same commit.
> >
> > I assume this is just a copy-paste error on your end, but it would
> > be nice if you could double-check and resend the pull request
> > based on the ee33e2fb3d70 commit that I merged.
>
> Nice catch. It looks I've generated pull requests incorrectly from
> v5.5 onwards, and this is the first time we've noticed. My bash
> history shows I started generating them like this:
>
>  git request-pull tag url tag

Ah right. I'm surprised this resulted in the correct shortlog
and diffstat, but that clearly explains it.

> I'll try sending this one again now.

I only started using b4 recently, so I wouldn't have caught it in the past,
as I wasn't paying close attention to the commit hashes. I usually
tried to ensure that the contents match up with the description, and
that worked fine. I've had sporadic problems in the past with b4 and
it's possible that I just papered over it with a manual merge thinking
that I did something wrong instead of b4 pointing out an actual
problem.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
