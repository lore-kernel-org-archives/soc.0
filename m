Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B49AC433F5
	for <soc@archiver.kernel.org>; Sat, 28 May 2022 20:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9742C3411A; Sat, 28 May 2022 20:39:31 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28D99C34119
	for <soc@kernel.org>; Sat, 28 May 2022 20:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28D99C34119
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id n10so14438943ejk.5
        for <soc@kernel.org>; Sat, 28 May 2022 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L1kBeURXP1GB/kHBU8GORq7J0BLUBtbdZ3DIpYlBaTc=;
        b=DjAdbu7azasbs7NwcB/7SaHAszgGECqjn47oqs1k4xlPedT4RzvCX0QqPq7lBkKL8h
         kCDd8EbrgSMsdYPGW3kd71I2wnB1fj5aTc/XMHG5vhBWAJyMC5IrsfUpAp0qTXGDSYTv
         IHcvWUBdT5BZzPhVuRmnJn+4dngxb6cwXB33Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L1kBeURXP1GB/kHBU8GORq7J0BLUBtbdZ3DIpYlBaTc=;
        b=a8OGs8Y+QyFvk5d9wOsBSsZk+Ic37WvlhShjZ41pH/j0cmu8Bh/7z4zsJSpRcXkJwy
         ZiilmgxBAzLufMHOLNNkU/mL9fWILMsjLIKB7ZD6q9KBBzLNSYYw/L7F57CfKCwVt5C7
         iVDRNLuk1dDC2kwE1ujF6fTCics1eTdS2VJgmKuh0dR+ioiwNp+b/JbNPwAt0SE49OeS
         sGZ6iOc5RUnhaWeYOoHWWLAt/scf4YgiSTLh7Tu2R6N6rtG3m6RJ5oYzzq7mPYM0Zxpi
         U+/ZOHb5B6H6Xcm471lA066pvb6PnnhkCQzrHe9TNAsoirMJwyOIUZBz+5q6q8RVilo6
         lXTA==
X-Gm-Message-State: AOAM530lAPwD9xfmku3aMN5JogzFz2zx0s74Ycmz8Pq7uoGGDXzbVMlh
	/SGv35GLbo7JrkJRji0nutUXOmKM5MZWPfBKbmQ=
X-Google-Smtp-Source: ABdhPJwcCSlVwhJFv5s2P3ziQzS9iwXw7mh6ytwIxiNGgsgzBtzYWbJB4EOzNuvOOZH7DxvHT882Lw==
X-Received: by 2002:a17:907:3e98:b0:6fe:be1c:af86 with SMTP id hs24-20020a1709073e9800b006febe1caf86mr32777695ejc.632.1653770369106;
        Sat, 28 May 2022 13:39:29 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id p8-20020a170906604800b006feba31171bsm2702639ejj.11.2022.05.28.13.39.28
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 13:39:28 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id f23-20020a7bcc17000000b003972dda143eso6394168wmh.3
        for <soc@kernel.org>; Sat, 28 May 2022 13:39:28 -0700 (PDT)
X-Received: by 2002:a1c:7207:0:b0:397:66ee:9d71 with SMTP id
 n7-20020a1c7207000000b0039766ee9d71mr12380873wmc.8.1653769900324; Sat, 28 May
 2022 13:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com> <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 May 2022 13:31:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
Message-ID: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
> option, you the kernel is built for the old 'OABI' that forces all non-packed
> struct members to be at least 16-bit aligned.

Looks like forced word (32 bit) alignment to me.

I wonder how many other structures that messes up, but I committed the
EDID fix for now.

This has presumably been broken for a long time, but maybe the
affected targets don't typically use EDID and kernel modesetting, and
only use some fixed display setup instead.

Those structure definitions go back a _loong_ time (from a quick 'git
blame' I see November 2008).

But despite that, I did not mark my fix 'cc:stable' because I don't
know if any of those machines affected by this bad arm ABI issue could
possibly care.

At least my tree hopefully now builds on them, with the BUILD_BUG_ON()
that uncovered this.

                   Linus
