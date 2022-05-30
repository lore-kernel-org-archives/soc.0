Return-Path: <SRS0=ER9w=WG=intel.com=jani.nikula@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C24DC433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 09:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0250EC385B8; Mon, 30 May 2022 09:31:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EE59C34119;
	Mon, 30 May 2022 09:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EE59C34119
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653903087; x=1685439087;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=RNo1VFn9TNhcSAwdGqSc/kbrNGzlnlE99QCowyLqR4c=;
  b=hE21XmWSS0E/O1wON30DF892tKRUjqSiTkCf7nIKPiyPOcMMJEHN3oUO
   fJRMkXbSb++IME4/70dVAXgLDMLazA88V6iw+xifPRQHY9+mabm+YVlRo
   5IhkoEoP4WEecNkGNJmH3qz3NJoxhCHPRFPq2rTdQL+ITRtH54DSRgswf
   0NgZXdg11HPmFLiWB3p9TIwPeYLmMsvQiTHi3DA+saScEsaPNQdTsfLA4
   T06rdd8kWg5s/0dFiyzOxvtJ1cT8maGQWucXheNse1KjP3itEihcLNn7f
   S4EAua+0lCMIT0MnQeQtCfBVcYUNAL+Kom3nb1ORgtSKolbubuwJTQJPd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="255438075"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="255438075"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 02:31:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="706083847"
Received: from jkuna-mobl.ger.corp.intel.com (HELO localhost) ([10.249.150.228])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 02:31:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann
 <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
In-Reply-To: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
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
Date: Mon, 30 May 2022 12:31:17 +0300
Message-ID: <87a6aztli2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 28 May 2022, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
>> option, you the kernel is built for the old 'OABI' that forces all non-packed
>> struct members to be at least 16-bit aligned.
>
> Looks like forced word (32 bit) alignment to me.
>
> I wonder how many other structures that messes up, but I committed the
> EDID fix for now.

Thanks for the fix, and the thorough commit message!

> This has presumably been broken for a long time, but maybe the
> affected targets don't typically use EDID and kernel modesetting, and
> only use some fixed display setup instead.
>
> Those structure definitions go back a _loong_ time (from a quick 'git
> blame' I see November 2008).
>
> But despite that, I did not mark my fix 'cc:stable' because I don't
> know if any of those machines affected by this bad arm ABI issue could
> possibly care.
>
> At least my tree hopefully now builds on them, with the BUILD_BUG_ON()
> that uncovered this.

Indeed the bug is ancient. I just threw in the BUILD_BUG_ON() on a whim
as an extra sanity check when doing pointer arithmetics on struct edid
*.

If there are affected machines, buffer overflows are the real danger due
to edid->extensions indicating the number of extensions.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
