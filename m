Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A78C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 10:57:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD65764E67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 10:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD65764E67
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0GKTf8VDCUmC1uH5KeV2vU4nVYloMCs2u7yoSZYc+MI=; b=WUZWN7aHz8iphrwLcUu/Zk4Xa
	voty/ZalGY1Iq+AaPzHrNI8kb0kpj3g8cs4SUmYoMNdr8mOtMUkklKY7WiGxAL+erTJYlMqGmCbJi
	iGX93qiG6GBRdZvwjFoHL3YCfbrYJmTjlx9ldSe8CYPNlmAerm6xrPR/lktLjrzjn4mooyDCYbaN3
	RJzzv8s2BCyCcPg/zyycdXJyW5cd2KMr8RkX/GpK58CJoSEsBeXnC6hQZD0iWnDmB6decAaMC3V0E
	Rqcn/X6tK4Clccq7FaoUCKz1uaXHC9LhcLQQhBrW2iAyAxcj31WdMLAtRAFwgyXErUX6fEWNWx5Dm
	fwzDf39rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHldU-008P5p-Fa; Thu, 04 Mar 2021 10:55:16 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHldK-008P4f-EJ
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Mar 2021 10:55:11 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhFpq-1lvlHk2aw6-00eKkm for <linux-arm-kernel@lists.infradead.org>; Thu, 04
 Mar 2021 11:54:58 +0100
Received: by mail-oi1-f170.google.com with SMTP id f3so29581250oiw.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Mar 2021 02:54:57 -0800 (PST)
X-Gm-Message-State: AOAM532WF3ug2paY9lYlPMPrc5kZ9U3mDo5j6Q8qoQKhst4jx7Or+cu+
 uNb7MD8tdkJnbcFr86Sg9r93hJP7x9cEjQ3GrbE=
X-Google-Smtp-Source: ABdhPJytX8nn9WHwGZ7rb0wgm/6H84zd3AC843FxpQZ5cioWDF+zMks/HkXPuRTfr7wcNPv4syg2U/RoyxzEgDNs6dQ=
X-Received: by 2002:aca:5e85:: with SMTP id s127mr2376937oib.67.1614855296283; 
 Thu, 04 Mar 2021 02:54:56 -0800 (PST)
MIME-Version: 1.0
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 11:54:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
Message-ID: <CAK8P3a17oRP=mU09ypPSxY3ms=fCROxk8SXo0S+CQpdtvsoHXA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
To: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Olof Johansson <olof@lixom.net>, 
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
X-Provags-ID: V03:K1:5BxEriacSr90wflLWVxFRPnvHIBks//sMw/09AOZVsgY0bC2cA5
 DhiWFEX9ItGQoWffSxKQbXxJNvQsvgy7+6GkLE3NJTzHlPvX0T5PMHbjUlAJQSs/5KGaePO
 ZszF1iOTaPzJBjDXbx1oCwmo7pNGBPdVeVm3g8kSrZ5O8sdVwRi16G2uuXJeG0oNlG6YRoc
 Fl4LrP8uWBwZ8o6SN0vOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TOpfcCo0oa8=:jksamEnm9tsGU1NX+QhgI0
 Lhc4Z0zadGiZVk+AvwXr95PlD75Of4O1R16bar1ysR9acYcHEaDTogoOj1oL03rew/WAmas/4
 rXRLbt7lkzPoZRiTFvB6iNj233KiOVYpS8inRTk+fwxT7fndYchKADQVEGRI7+uVHa/fZ+fHL
 zKyKaFrJjiStsBlzJgIO2oOHcUixUPRRKx4flAmmlFQrik13uY7lgdPUdteSB5O1TK0u6rFKF
 ynb9nx+rhWwO4hJZENb/SJx3RgHixDaIzHltWjlm47UMCWSRmEUmQ0byyJG1FXqSY2VQpZOor
 GQ+xA+RX6sDpz/RyHVo6JmEiJ8lMaItKLhw/c7duSbm/wLLnim1pSPiKo/brVdaMtfxFAPv4B
 2Ku32B/VAoIQWchwdobKaXdd0G2EmlJ+9GlV2PWcjMQWBnJd7avwzyeKClZjHMbLtaU93elS5
 7MBoffDXTMYS+1NSAL8bhyJiP7SNEDaBNK3oxwNEnRKr1jOskQkQ
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
Message-ID: <20210304105439.4NajGJzIq0yDQD_GjZC4wAmO8yOPqADLR5BJaB4jVLI@z>

On Thu, Mar 4, 2021 at 11:34 AM tan.shaopeng@fujitsu.com
<tan.shaopeng@fujitsu.com> wrote:
> > On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> > <tan.shaopeng@jp.fujitsu.com> wrote:

> > > +module_param(tagaddr_ctrl_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(tagaddr_ctrl_reg, "HPC tag address override
> > control register");
> > > +module_param(hwpf_ctrl_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(hwpf_ctrl_reg, "hardware prefetch assist control
> > register");
> > > +module_param(sec_ctrl_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_ctrl_reg, "sector cache control register");
> > > +module_param(sec_assign_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_assign_reg, "sector cache assign register");
> > > +module_param(sec_set0_l2_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_set0_l2_reg, "sector cache L2 way
> > register(sector=0,1)");
> > > +module_param(sec_set1_l2_reg, ulong, 0444);
> > > +MODULE_PARM_DESC(sec_set1_l2_reg, "sector cache L2 way
> > register(sector=2,3)");
> >
> > My feeling is that the actual settings need to be on a higher level, not tied
> > to the specific register-level implementation of this chip. Normally,  the L2
> > cache is set up by the firmware according to local policy, and the settings
> > can either be read by the kernel from registers or passed down through the
> > device tree. It sounds like you want to control the policy at runtime in the
> > operating system rather than at boot time, so for each setting you wish to
> > override, there should be description of what the setting does and what
> > the purpose of overriding the firmware setting is.
>
> OK, I will change module parameter from specific register-level to
> a higher level. And, I will modify the description of module parameters.
> To be clear, we don't suppose these parameters (EL1 registers) are
> often changed at runtime.
>
> > Looking at the first one in the list, I see the specification mentions
> > multiple distinct features that can be enabled or disabled, so these
> > should probably get controlled individually.
>
> It is not necessary to enable/disable every feature individually.
> There are no plans to use these features individually.

Ok, in that case you probably want a smaller number of global
settings can describe all the combinations one may need in
practice.

> > I also see that it is possible
> > to control this for TTBR1 and TTBR0 separately, and we probably
> > cannot allow user space (through module parameters or any other
> > interface) to control TTBR1, which is where the kernel resides.
>
> This driver does not change the values of TTBR0 and TTBR1,
> and the values of TCR_EL1.TBI0 and TCR_EL1.TBI1.
> The cache functions can be used when TBI is already enabled.
>
> > The TTBR0 settings in turn would seem to interact with
> > CONFIG_ARM64_MTE, and should not be controlled independently
> > but through the same interfaces as that if we find that it does need
> > to be controlled at all.
>
> MTE is not supported on A64FX.
> So, this function does not conflict with MTE.

But could you guarantee that no future generation might support
both features? In either case, it sounds like the kernel would need
to know when this is enabled in the same way: as far as I understand,
both of these put extra information into the upper eight bits of a
pointer, and any code that interacts with user addresses would need
to know about this.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
