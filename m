Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E66C64E8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:06:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA56E20725
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKxrjkwq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jiz89VUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA56E20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5c/hIQEyMNt55yqaL4JIzMWWCBGQ4VLLlkNvQsn+onY=; b=QKxrjkwq0ZitD+Kd83nHJOVvJ
	POcd1IUGphFOfqpalq2nEOXldxcp3SFPWI5tDWMBcdWiC71eJP8k4tkPWXNP8pwf2i7Om5WdGGuvr
	MaikZQ3LldnVRsdISIKc3hVnF0hXaCra04s0pn3vIRzbQL95MxJB2nhg3w4LM0DiBa74XThvtzyci
	DxiyhZBXVEt6AbJpnU/gpuNe00wNkM9zsHmQk/MFPmnwhdkwUgiSaT7uFDJK1MBewAeK7PAWZCFHo
	wsrmiNZgNoVO6HDzOlnXZ4kEpEykqPoxUVmdXsPrKRsdTygJKc8tYm+/ylGFwOB+Ke/v3oFzc23HV
	oo/kALkdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjmbO-0007Kk-C7; Mon, 30 Nov 2020 17:04:38 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjmbK-0007JR-8l
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 17:04:35 +0000
Received: by mail-vk1-xa44.google.com with SMTP id v185so2869827vkf.8
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4msmqDOfKObIFWARrlUIAyeyp98c2WbJXAojFWVjL5Q=;
 b=jiz89VUfVeu6ZDf1HTb9VDFHMU/JtuGtS7QbPW+TCJsD5d7Ktvd3+evJiC5uQzeHQ6
 iW/+sn42aeXM9qqI8VyKe00YdzXPlXKqyAY0r4Dq46nXjsDxbhLeaB0ayB1PPttRqdv+
 FFF92mLkFds4vC356CH15VY01XN4vX5nd2HRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4msmqDOfKObIFWARrlUIAyeyp98c2WbJXAojFWVjL5Q=;
 b=Tn1Wk6Nxn7OP2H3hgq0e8+g04PiYXRaV3dBAnEpwXTdN5oS40XrpDv7wTlau+Iq2Lz
 iM4qpzhmoDTPuMibsxnJJSLiEcxiMThcSRCuuwUjVWTRmkAePxSdlWqbJurem5uduFhF
 A3g8xhpq7t9n9EMuZRY+8IEjhKZqnphZq4ZdRKE9j7JyXUEm/tGvNq8iq0Q1Cdcj6Ll7
 yhzFK5QXSvdKQFyG3JqXRItagSeIReMvmf4C/mLzNBK/l0zmAgr4gpVmdTcy59TQ4meI
 EGnMOGwpbvd/fqZ3o0OSE4SjoFfe7lSMT+4gM0mPwcjZwHCu7IRwpU1cNFNKBP+SxXyv
 EDiA==
X-Gm-Message-State: AOAM531ObWi3g3+fIHwlbDFUReH0EUwruMtI51pshwKh1e9T0MyO5z1l
 72b98PL0KvmOG3NtxjpDANeK0ZtSgk2J/Q==
X-Google-Smtp-Source: ABdhPJxuOGhmwtvmnNWk2IKAMXTApcExrc/4i0/AHdf6nddPw116mXG+7b9grTnnmOtku+nJ0jq2FQ==
X-Received: by 2002:a1f:3649:: with SMTP id d70mr16420383vka.24.1606755870096; 
 Mon, 30 Nov 2020 09:04:30 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id 127sm5207624vse.8.2020.11.30.09.04.29
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 09:04:29 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id g23so2659378uan.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 09:04:29 -0800 (PST)
X-Received: by 2002:a9f:36a1:: with SMTP id p30mr14987150uap.64.1606755867146; 
 Mon, 30 Nov 2020 09:04:27 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
In-Reply-To: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Nov 2020 09:04:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
Message-ID: <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_120434_955274_64D37A43 
X-CRM114-Status: GOOD (  38.50  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130170415.Zhng00LBPp2qH4MRud_5CPNJ-oreZyYevz-x9VV2fT4@z>

Hi,

On Fri, Nov 27, 2020 at 2:56 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> >  - Some DT patches for the Rockchip RK3399 platform,
> >    in particular fixing the MMC device ordering that
> >    recently became nondeterministic with async probe.
>
> Uhhuh.
>
> I didn't realize this MMC breakage happened.
>
> That's just an MMC bug. Other subsystems have been able to do async
> probing without making device ordering be random.
>
> So this really smells wrong, and I just never realized.
>
> Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
> behavior appears broken.
>
> You basically should do the device numbering synchronously (or better
> yet - asynchronously, but single-threaded for the subsystem), and then
> asynchronously probe the actual device details after you've numbered
> them reliably.

+Ulf too

IMO if a sane/consistent ordering is needed for MMC devices that the
correct solution is that they should be assigned statically and not
rely on the happenstance of which drivers happened to probe in the
system in which order.  Assigning numbers statically is exactly what
we can do now in the device tree and I believe that the patches you
were merging from Arnd were doing exactly that.  To me it feels like
this is the correct long term solution here.

Without static assignment, maybe we could do numbering of MMC devices
in some type of a pre-probe routine?  Is that what you're suggesting?
If so, it seems like it might be a pretty big change to figure out how
that ought to work (if it can be made to work).

If numbering is done by a probe routine then I think we can't
guarantee order.  Among other things, I think EPROBE_DEFER could cause
us problems, like in this example:

1. A regulator driver starts probing, but runs async to allow other
drivers to load.

2. The MMC driver's probe routine runs.

3. In the MMC driver's probe routine, we try to get the regulator.
Depending on how far the regulator driver has run (which may depend on
external factors), we might get it or we might be told EPROBE_DEFER.
Let's assume EPROBE_DEFER.

4. A second MMC driver's probe routine runs.

5. The regulator finishes loading.

6. The first MMC driver's probe routine runs again and works this time.

In this case the first MMC driver's probe routine ran _after_ the
second MMC driver's probe routine even without the MMC drivers being
async.

I believe there are other examples.

Now, of course, it should be noted that on a given board with a given
kernel configuration it might be impossible to ever hit a case where
the order was inconsistent.  However, I believe that there are
legitimate cases where the order would have been inconsistent.  Also
note that code changes to other parts of the system (like adding async
to the regulator subsystem) could suddenly introduce different
ordering even if it was previously impossible.


> This is not something new - we do this for pretty much all the other
> block devices, and MMC is just doing things wrong.

Just to confirm, I assume you are specifically excluding all block
devices attached via USB, right?  I believe that, by its very nature,
it's nearly impossible to guarantee the ordering of USB device
enumeration especially with complex USB hierarchies, but I certainly
could be wrong.  Until devices are enumerated, we can't necessarily
know how many block devices will be provided.


> See SCSI probing for the traditional horrible cases (where just
> spinning up a disk could take tens of seconds).  "Slow probing" is not
> an excuse of "random ordering".

It's odd that you say that.  I actually fought for static numbering
years ago and one of the arguments _against_ allowing static numbering
for MMC devices [1] was that, to quote:

> Exactly the same issue arises if you have more than one ATA or SCSI
> adapter in your PC - things can be probed out of order and end up
> in different /dev/sd* slots.

That was over 4 years ago now, so perhaps things have changed in the
meantime, or perhaps the person who said that was wrong.

Ah, I just re-read more of the old thread and you're probably talking
about what Peter refers to [2].  I guess, though, that must rely on
all parent devices (like PCIe) doing their probes in a fast enough and
synchronous way, right?  ...and I guess it relies on parent devices
not running into problems like the EPROBE_DEFER problem that I talked
about above?  Specifically, someone could have a MMC or SCSI adapter
in a PCIe slot, right?  Until we probe the PCIe slot we don't know if
it provides any block devices.


> Behaving randomly is simply not acceptable.

Agreed, which is why I'm a fan of the static assignment solution.


In the end, I believe that we could revert my patches and go back to
numbering being consistent for most (but not all) use cases.  Even
before my patches, MMC already did most of its slow stuff async and my
patches only save ~40ms of boot time per MMC device, so the solution
you talked about for SCSI was already there, but I wanted to save the
extra 40 ms.  If we revert, though, I'm not sure how we will ever get
to the goal of "async probe by default" then, but maybe that was a
pipe dream?  ...presumably we'd also agree that we'll be limiting how
much async work can happen at boot in general since anything in the
path that might lead to a block device needs to be synchronous /
ordered, right?


In any cases, I'm interested to hear thoughts from you and others on the above.


[1] https://lore.kernel.org/r/20160429181248.GW19428@n2100.arm.linux.org.uk/
[2] https://lore.kernel.org/r/5723FCE3.9070308@hurleysoftware.com/


-Doug

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
