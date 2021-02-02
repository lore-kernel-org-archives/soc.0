Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D8AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 19:28:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 417BC60295
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 19:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 417BC60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RxggRov9qcqjiHMkgBYY4uReKjEO20Qo8pW5XqISqcQ=; b=betxR3LZzvHjRNI31YSkJYkVV
	WVG4IchH42ZnQjEDlS+clJhmSsU8bA7+u5lLU3KuPpmZcjN6wCYFJi5Vtybzr06Aw/5hnKXoDT35d
	doAzuW3eQf65nQbjglHuweY/6HLgBIppfrfa5GnJGhV5Sh0seRKjoo8D3eyYt6faUuGMQxznyT4HR
	P8tKiwbLIR1LdpTWCyRMWHt0fUKMpeOMbwcmJtYjCHIZ6ADXJpcdpzoSn1DBn6QVZs7bk00rDnInz
	JXnp9Y3UKsNfqQF0gSPWzD4W/cIxPhAzJHIgsYrMT2nYPDzptj7bzybVFpxSjD0e2u4jNPWMZ6gPn
	YHxGcbAZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l71KN-0003LD-6I; Tue, 02 Feb 2021 19:27:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l71KK-0003Ks-JT
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 19:27:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 918CC64F2C
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  2 Feb 2021 19:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612294023;
 bh=JOrJpOB/SuaiOIdAV52d94tqRV1dVJ79E5TKIZlCzE0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=OI67SuLFd0aH3FWN3cav9YqExyA+Dfjpb2fo0HicSGYkb6kfs9+sEsO2qZzobHzRf
 AkOhZqMZKWRY0zcTs49CoJf1H/PJCVMWHrMrjj+usggRqVU78Wcz0245ox2Gp2ZFAQ
 HYeY0VVMeemqLwajRrwIYvsuEAI+6jIhzd6pPmdrKSipdPEjKBo3cfKYG8HBByrqrS
 l8Ydrq4Ofbfbe8GM0hW1reA3tfKZVHWnTh3gQS2GWRB996uSfXLk4AS6rOjekKvK8v
 3/say4NaJ8xnQKcXEHMf5Fe8/DlL1tRuQQH7JN2osRYXeGtyf2Gq9BJKFPuZbZZUnV
 jDwUekNv+ARJg==
Received: by mail-oi1-f177.google.com with SMTP id m13so23970286oig.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Feb 2021 11:27:03 -0800 (PST)
X-Gm-Message-State: AOAM531T5QKZPx/vwev6EmiPckOf8knmc647y1dY5qPkZqxTBP5SQOjd
 LO6GaJvegsPnTFtRRmqi/ks/8fGEkEJTpMfCBd8=
X-Google-Smtp-Source: ABdhPJzioZX45EBxJBWgLu/zqM3OU4TG+SrFVeMeG033Qh0xS+sHoh5IAA4HkvHZh033vzx0bINJMNheBIuoBWN0vZo=
X-Received: by 2002:aca:e103:: with SMTP id y3mr3764725oig.11.1612294022811;
 Tue, 02 Feb 2021 11:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
 <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
 <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
 <20210202190106.GA368014@demiurge.local>
In-Reply-To: <20210202190106.GA368014@demiurge.local>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 2 Feb 2021 20:26:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3toLOzgMVhgqakRWYT_7UO=XPaQPasf28Tf+Za4=a5-g@mail.gmail.com>
Message-ID: <CAK8P3a3toLOzgMVhgqakRWYT_7UO=XPaQPasf28Tf+Za4=a5-g@mail.gmail.com>
Subject: Re: ARM: dts: mmp devicetree updates
To: Lubomir Rintel <lkundrak@v3.sk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_142705_531546_EC6D78D6 
X-CRM114-Status: GOOD (  25.98  )
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202192646.I7FGQWFFJjLJYEpDmlONsZMUfbFuCX9UGAjvS-qyUFU@z>

On Tue, Feb 2, 2021 at 8:01 PM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> On Tue, Feb 02, 2021 at 06:13:18PM +0100, Arnd Bergmann wrote:
> > On Tue, Feb 2, 2021 at 5:41 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Fri, Jan 22, 2021 at 3:09 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > > > >
> > > > > chained to this message is a handful of patches related to MMP device
> > > > > trees and bindings. Please take a look and consider queueing them for
> > > > > for 5.12.
> > > >
> > > > These all look good to me, but I notice that a lot of them seem to be
> > > > bugfixes, so please have another look and decide if any of them should
> > > > go into v5.11 and perhaps backported to stable kernels as well.
> > >
> > > Hi Lubomir,
> > >
> > > not sure if you missed my earlier mail. To clarify, I have not applied
> > > any of the patches so far. Can you recheck if some of them should be
> > > part of the v5.11 release so I know which tree to apply them to?
> >
> > Nevermind, I just found your earlier reply in my spam folder. Applying
> > the patches now.
>
> Would you mind sharing why your spam filter decided to flag my message? (the
> X-Spam* headers, if there's anything relevant there). I'm wondering if it's
> possible other spam filters drop my messages for the same reason and if it's
> something I could fix.

Unfortunately, I don't see any relevant headers in there. It was gmail that
flagged it, and I marked it as "not spam" in there.

See below for the full headers:

Delivered-To: ...
Received: by 2002:a9d:620c:0:0:0:0:0 with SMTP id g12csp2295920otj;
        Fri, 29 Jan 2021 14:15:00 -0800 (PST)
X-Google-Smtp-Source:
ABdhPJzh9TqNk6chd2GuAc+VY/qSFLUcq1DVs2jFDmeV6JHdeXrU/LXSmWGGU24ph2aD1H9+30Qey6k4iLc=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr3935107oie.128.1611958498462;
        Fri, 29 Jan 2021 14:14:58 -0800 (PST)
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lkundrak@v3.sk designates
167.172.186.51 as permitted sender) smtp.mailfrom=lkundrak@v3.sk
Received-SPF: pass (google.com: domain of lkundrak@v3.sk designates
167.172.186.51 as permitted sender) client-ip=167.172.186.51;
Received: by 2002:a9d:628c:: with POP3 id x12mf3147715otk.2;
        Fri, 29 Jan 2021 14:14:57 -0800 (PST)
X-Gmail-Fetch-Info: arnd@arndb.de 3 pop.1und1.com 995 m38634048-1
Return-Path: <lkundrak@v3.sk>
Received: from shell.v3.sk ([167.172.186.51]) by mx.kundenserver.de
(mxeue112 [217.72.192.67]) with ESMTPS (Nemesis) id
1MEnZF-1lD5AP0cZf-00GEVg for <arnd@arndb.de>; Fri, 29 Jan 2021
23:12:10 +0100
Received: from localhost (localhost.localdomain [127.0.0.1]) by
zimbra.v3.sk (Postfix) with ESMTP id 6FADEE0B4F; Fri, 29 Jan 2021
22:08:03 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1]) by localhost (zimbra.v3.sk
[127.0.0.1]) (amavisd-new, port 10032) with ESMTP id WVW95jXP8lLx;
Fri, 29 Jan 2021 22:08:02 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1]) by
zimbra.v3.sk (Postfix) with ESMTP id 90B8DE0B4C; Fri, 29 Jan 2021
22:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1]) by localhost (zimbra.v3.sk
[127.0.0.1]) (amavisd-new, port 10026) with ESMTP id SBoZVgSkdasp;
Fri, 29 Jan 2021 22:08:01 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54]) by zimbra.v3.sk
(Postfix) with ESMTPSA id 3BAA3DF932; Fri, 29 Jan 2021 22:08:01 +0000
(UTC)
Date: Fri, 29 Jan 2021 23:12:07 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>, Linux ARM
<linux-arm-kernel@lists.infradead.org>, DTML
<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
<linux-kernel@vger.kernel.org>
Subject: Re: ARM: dts: mmp devicetree updates
Message-ID: <20210129221207.GA77366@demiurge.local>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
<CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
Envelope-To: <arnd@arndb.de>
X-Spam-Flag: NO
X-UI-Filterresults:
notjunk:1;V03:K0:G4Tnf8n73JA=:Xs89A/ylYGzE26U+VVjQs7m3EY
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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
