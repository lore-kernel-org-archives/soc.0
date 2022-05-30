Return-Path: <SRS0=ER9w=WG=intel.com=jani.nikula@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D22C433FE
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 14:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72521C3411A; Mon, 30 May 2022 14:08:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17EE2C385B8;
	Mon, 30 May 2022 14:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17EE2C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653919701; x=1685455701;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=4UKqK9LTE8r/QhEwT/GHcr6rLTi06cgfbkbko9SrhVU=;
  b=YRK72tNmw4KjW1PbCk7Yzyz/WXo54DPhJDIy6zZ3/8qAxFl0x4Ny09qM
   Qk0CYmcU0ia9rvwahkS/Q5AaJnUc14Z3bL7Pf+tTnFjKC1oGt4WUR0PIg
   u6G9TtBJ/0SmrLjQZr04kWQhd56eZG/lAkAuQleWnk3Fk/wNYZJuIXWWy
   IGc8YjZRj7nAivuOp3IyVt4MX5457uP7axFqJh/rOq0KXV2roT/OhcoIO
   qLlYbV55YOuhLIIlowUFub3XIVm9+tKzf6oYIQkbLK66nb5J24cp2d/F8
   +I4x1YaDgehHB/0zybB9rYAjTLPuz6QKmAfGzkSTeUugwwkpgP5rvscsz
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="272581014"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="272581014"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 07:08:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="605206585"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost) ([10.249.150.228])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 07:08:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, Viresh
 Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, Julia
 Lawall <Julia.Lawall@inria.fr>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
In-Reply-To: <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com>
 <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
 <87czfvrwsv.fsf@intel.com>
 <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
Date: Mon, 30 May 2022 17:08:11 +0300
Message-ID: <874k17ru44.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, May 30, 2022 at 3:10 PM Jani Nikula <jani.nikula@intel.com> wrote:
>> >
>> > I think in general, most __packed annotations we have in the kernel are
>> > completely pointless because they do not change the structure layout on
>> > any architecture but instead just make member access slower on
>>
>> Please explain.
>>
>> They are used quite a bit for parsing blob data, or
>> serialization/deserialization, like in the EDID case at hand. Try
>> removing __attribute__((packed)) from include/drm/drm_edid.h and see the
>> sizeof(struct edid) on any architecture.
>
> The annotations for edid are completely correct and necessary. However
> other driver authors just slap __packed annotations on any structure
> even if the layout is not fixed at all like:

Right. Thanks for the examples.

> struct my_driver_priv {
>        struct device dev;
>        u8 causes_misalignment;
>        spinlock_t lock;
>        atomic_t counter;
> } __packed; /* this annotation is harmful because it breaks the atomics */

I wonder if this is something that could be caught with coccinelle. Or
sparse. Are there any cases where this combo is necessary? (I can't
think of any, but it's a low bar. ;)

Cc: Julia.

> or if the annotation does not change the layout like
>
> struct my_dma_descriptor {
>      __le64 address;
>      __le64 length;
> } __packed; /* does not change layout but makes access slow on some
> architectures */

Why is this the case, though? I'd imagine the compiler could figure this
out.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
