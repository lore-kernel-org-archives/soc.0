Return-Path: <SRS0=F7km=L4=intel.com=jani.nikula@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B5C10F15
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 08:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16293C4AF07; Tue, 23 Apr 2024 08:06:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D051FC116B1;
	Tue, 23 Apr 2024 08:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D051FC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713859566; x=1745395566;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=1G2wfwFlzUQsBtBXl3QVOUc+WealeiEYe1NA+eUKk9w=;
  b=ei+2z/2vJ4i5ZHZkpIoZjmEmwB39p7BK3ao4aLF574A5zQzzf1wVA3p1
   1JxRPhr1FPKab43DTHzkUpW0d+PKApvH3afMqn2msDaaaWxPlVjFIDOA+
   Pzoud5gSf3Y4QRc0J3mNvb2lYAkgLgGcXXoQPFWx61QwytNkegR4udvO7
   BW87A32du/y45JcpF9ixS8U4F5MzuB7TZ7w6Xuu8wseAABa0EQ0bqFpRg
   E9rMHX+Fq1QpkNjmiIqZagw+e183yCtS0juviut3jsbZ3sYOEiXJUs5og
   N13Jysku5OSTt7F9ECnFVILvd0zGeT1OOhUvXsMrqHsHocbDb8f5h0f01
   g==;
X-CSE-ConnectionGUID: 4QegkNYoRfyD/xWIy2OkCw==
X-CSE-MsgGUID: mE6QtkQVSD2qyZtVXlf2zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9649880"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9649880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 01:06:05 -0700
X-CSE-ConnectionGUID: 2pZv5y+bRdWiLyPwdQlQmg==
X-CSE-MsgGUID: PVL+lBr9SF6FJ1Vhx70a/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24736040"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.46.117])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 01:06:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel test robot
 <lkp@intel.com>, soc@kernel.org
Subject: Re: [PATCH v3 07/13] drm: Make drivers depends on DRM_DW_HDMI
In-Reply-To: <ZidLFpREqwKd9FHK@finisterre.sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
 <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
 <ZidLFpREqwKd9FHK@finisterre.sirena.org.uk>
Date: Tue, 23 Apr 2024 11:05:58 +0300
Message-ID: <87le54sduh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 23 Apr 2024, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Apr 02, 2024 at 04:43:46PM +0100, Mark Brown wrote:
>> On Wed, Mar 27, 2024 at 11:57:02AM +0100, Maxime Ripard wrote:
>> 
>> > DRM_DW_HDMI has a number of dependencies that might not be enabled.
>> > However, drivers were used to selecting it while not enforcing the
>> > DRM_DW_HDMI dependencies.
>> > 
>> > This could result in Kconfig warnings (and further build breakages) such
>> > as:
>> > 
>> >   Kconfig warnings: (for reference only)
>> >      WARNING: unmet direct dependencies detected for DRM_DW_HDMI
>> >      Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && DRM_DISPLAY_HELPER [=n]
>> >      Selected by [m]:
>> >      - DRM_SUN8I_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM_SUN4I [=m]
>
>> This has landed in -next and appears to be causing breakage for several
>> platforms using these devices.  For example I'm seeing the HDMI fail to
>> probe on sun50i-a64-pin64-plus with arm64 defconfig, the DT kselftest
>> result isn't terribly informative but it can be seen here:
>
> It has now been *three* weeks that this breakage has sat unaddressed in
> -next, this has been making my CI for -next unusable.  Given that
> getting the defconfig bits of this merged appears somwhow unreasonably
> difficult can we please drop these changes from the DRM tree until some
> strategy for getting everything merged is put into place?

This is what's being done [1].


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1713780345.git.geert+renesas@glider.be


-- 
Jani Nikula, Intel
