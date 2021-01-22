Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B449C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 15:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC77123A84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC77123A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tpVcqMKyiF7EYRBPRza+cZ2kDMFUnn64DlcC/LfsHn4=; b=wc5k0781/oTBRdkdjxu3Kavd+
	3us+mesLC63eu+oZTsN+VLB6OALtOYdOokRtby0h+lAnJ45m0m7bATQ3CNUB+FnqTuaxPFKr1+BaJ
	sd0jbqBAY8LdHV8C2efyAGYL2+Chwu/6OfstLlfuFaI5wneOIchldvCAUJ7TrwwB8SBJOVRTl7JZM
	Cf7HA1LAiLpG5a5hPgghLm775VpxJ4dau8tmY2gEy+sdpZc/iehE+wiM5smyV3dTpkfECtbwUrsSd
	R2spYwfYV4rYPPMeu8bSWB5FTK5AGFhZkO2PtQtmtkGwfJ8XHwNI0Zhk99NzZxcUqQi1NCDBGXlK1
	WxYbLJqew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yK8-0002UY-4M; Fri, 22 Jan 2021 15:26:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yK5-0002U5-SU
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 15:26:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 745D823AAA
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611329164;
 bh=j7POJbXKTzDuB3/eYG14J7veIFugGno/3G4vA/5heEY=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=XkaCH1PkYNMAV1ZuIaicePstgpavdjiYnAKaiZ7ZWRgkKEcl55k61d+1TyObR4PTz
 9q3mWc9suY579Rq8uT9oF2rtWf8x/DjgwWiYtCiHwA/xhT62a4cp+FmKgl0gymPiUM
 geKq3QHTu1ogxeoEz1kXgONs0zotT6H5dmUy/iGFnBIMRzLyQ1c7528iyTjQOSq5A0
 aDX3LnhtuXPhyAjIm3tkWIjDYgibTKu5EboCE9vZNT1T4n9miV98M+aJJD0QHW0oFC
 LwAvyTsUbduCdoIuMAUL9cK1tsAPYY7Zz7F8vvAWV342kS0trsfM7mqWulxYVOe6kZ
 EyZQZkxJnrIzQ==
Received: by mail-ot1-f49.google.com with SMTP id v1so5376401ott.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 07:26:04 -0800 (PST)
X-Gm-Message-State: AOAM5339sLsBVYmxNwHdfajEcV51DpUiyOnQ7j1iR5RZfysOzwwQEyEf
 EZWHIA4ppj6065Hb/I2JxI+aaijqUc4BPbPG3uU=
X-Google-Smtp-Source: ABdhPJxBc2BUd+tDE56eSr6EAXddRpNZSF16hXtFyUYar1ooFQ3C99Hc/fJ3T0D4QcNjqsPaaGQC5xFsuAQkpJAiAkM=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr3692162otk.210.1611329163798; 
 Fri, 22 Jan 2021 07:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20210122143536.168833-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210122143536.168833-1-nicolas.ferre@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 16:25:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
Message-ID: <CAK8P3a0s5UPvCzQrcYmPPDYgT+YyZ3vc=fF0GEwpqROR+Zio-g@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12
To: Nicolas Ferre <nicolas.ferre@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_102605_980883_BB132235 
X-CRM114-Status: GOOD (  18.85  )
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
Message-ID: <20210122152547.rfCE5mQM8HMrRBpQZ08tw-Gy-0qvcTfAVf6BNX-IZ-4@z>

On Fri, Jan 22, 2021 at 3:35 PM <nicolas.ferre@microchip.com> wrote:
>
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>
> Arnd, Olof,
>
> I'm taking back the lead on sending the pull-requests for AT91 and hope that I
> didn't loose the knowledge in the meantime. Tell me if there's something I'm
> missing. Thanks a lot to Alexandre who kept our flow steady and very
> predictable during all those years!
>
> Here are the first SoC changes for 5.12 which contain a single patch for multi
> platform kernels.
>
> I plan to send another pull-request for the SoC changes related to new sama7g5
> that Claudiu sent to the mainling-list recently. I'll let it mature in
> linux-next by the beginning of next week and will send another pull-request by
> mid-next-week.
> Tell me if you see a problem with this approach.

This all looks good to me, but I think I'd rather take the 'soc' pull request
into the v5.11 bugfixes, as this may already affect users on other machines.

I would also suggest adding a 'Cc: stable@vger.kernel.org' tag. If you like,
I can just cherry-pick that patch into the fixes branch and add it there.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
