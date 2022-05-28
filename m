Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16888C433F5
	for <soc@archiver.kernel.org>; Sat, 28 May 2022 18:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C542AC34113; Sat, 28 May 2022 18:14:24 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E837BC34100
	for <soc@kernel.org>; Sat, 28 May 2022 18:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E837BC34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f49.google.com with SMTP id h19so811162edj.0
        for <soc@kernel.org>; Sat, 28 May 2022 11:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iGqp3sqIQ6D1oqU2b3UQ+JQ14av/DX22LG0p5NM1mUo=;
        b=Px8PhLWYRiqNg8y87VlDUDsLJH2RoVnLN8Jl2LVu1LymXQyB5v2VGxblVmbq7n6ao8
         VU3hqglYO5WBsoT19tAqis2S52THyYxULaMlPuhCVc+o+wPTrAjTjNWJDkwjJ3dtGVFj
         8QZXFAV7pfp7xwqlA1vAGNq2rUWHaa1b3lzak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iGqp3sqIQ6D1oqU2b3UQ+JQ14av/DX22LG0p5NM1mUo=;
        b=c15GNAzo8GFWVAFSxIv+No16triPFZsB5hojjGjw1OfoGC+EOd6128PlgTXa/pRvtu
         bvtEHoif+yQ7kCBZH1mrpyGWlcvzlafMNX4paivbqwB8T5gtrkF1zBkkzJBErtw+R3A2
         U5//PHBrMdWzimev2qbh290mIKj0Fj21ryRyx7VU6JjkqegFwEstskWtOEhNiTMNalVD
         YlaRCelG4Q9hHUaPYHsNoagZh+j5/0n/DlbDeJ1lDpRaqKTUTnqZKmMPNIsAZAqDVApc
         gDlnJsiD5qPMVV6Qc5fFZ2oey7xjOmyrTRCgpq3VwpPhx07x++yZ2Had4prx0CCotfVJ
         x4pQ==
X-Gm-Message-State: AOAM532L9qUGtsiClUFaA5V3qph1Ga+JR4cvICkzzCdaiEePwDZFA08S
	L08kWMzsicuANe3XmVDTbCVfzNPx0dsI5Qgd
X-Google-Smtp-Source: ABdhPJx40XbiC6J2M4VL6HsFBv3b45ZAK+BToICo1EZ8K634+8OhEfsvIfHl9JKSszG+A453Q2wy3g==
X-Received: by 2002:aa7:d30f:0:b0:42b:db1f:73ae with SMTP id p15-20020aa7d30f000000b0042bdb1f73aemr13894406edq.392.1653761661892;
        Sat, 28 May 2022 11:14:21 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906774300b006f3ef214db7sm2572168ejn.29.2022.05.28.11.14.21
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 11:14:21 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id f9so14171990ejc.0
        for <soc@kernel.org>; Sat, 28 May 2022 11:14:21 -0700 (PDT)
X-Received: by 2002:a05:6000:16c4:b0:20f:cd5d:4797 with SMTP id
 h4-20020a05600016c400b0020fcd5d4797mr28588153wrf.193.1653761344659; Sat, 28
 May 2022 11:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
In-Reply-To: <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 May 2022 11:08:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
Message-ID: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: multipart/mixed; boundary="0000000000007e28af05e01651d2"

--0000000000007e28af05e01651d2
Content-Type: text/plain; charset="UTF-8"

On Sat, May 28, 2022 at 10:40 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So digging a bit deeper - since I have am arm compiler after all - I
> note that 'sizeof(detailed_timings)' is 88.

Hmm.

sizeof() both

    detailed_timings[0].data.other_data.data.range.formula.gtf2

and

    detailed_timings[0].data.other_data.data.range.formula.cvt

is 7.

But the *union* of those things is

    detailed_timings[0].data.other_data.data.range.formula

and its size is 8 (despite having an alignment of just 1).

The attached patch would seem to fix it for me.

Not very much tested, and I have no idea what it is that triggers this
only on spear3xx_defconfig.

Some ARM ABI issue that is triggered by some very particular ARM
compiler flag enabled by that config?

Adding some ARM (and SPEAR, and SoC) people in case they have any idea.

This smells like a compiler bug triggered by "there's a 16-bit member
field in that gtf2 structure, and despite it being packed and aligned
to 1, we somehow still align the size to 2".

I dunno. But marking those unions packed too doesn't seem wrong, and
does seem to fix it.

                  Linus

--0000000000007e28af05e01651d2
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l3q6oh0p0>
X-Attachment-Id: f_l3q6oh0p0

IGluY2x1ZGUvZHJtL2RybV9lZGlkLmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZWRpZC5oIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAppbmRleCBjMzIwNGE1OGZiMDkuLmIyNzU2
NzUzMzcwYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZWRpZC5oCkBAIC0xMjEsNyArMTIxLDcgQEAgc3RydWN0IGRldGFpbGVkX2RhdGFf
bW9uaXRvcl9yYW5nZSB7CiAJCQl1OCBzdXBwb3J0ZWRfc2NhbGluZ3M7CiAJCQl1OCBwcmVmZXJy
ZWRfcmVmcmVzaDsKIAkJfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBjdnQ7Ci0JfSBmb3JtdWxh
OworCX0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgZm9ybXVsYTsKIH0gX19hdHRyaWJ1dGVfXygo
cGFja2VkKSk7CiAKIHN0cnVjdCBkZXRhaWxlZF9kYXRhX3dwaW5kZXggewpAQCAtMTU0LDcgKzE1
NCw3IEBAIHN0cnVjdCBkZXRhaWxlZF9ub25fcGl4ZWwgewogCQlzdHJ1Y3QgZGV0YWlsZWRfZGF0
YV93cGluZGV4IGNvbG9yOwogCQlzdHJ1Y3Qgc3RkX3RpbWluZyB0aW1pbmdzWzZdOwogCQlzdHJ1
Y3QgY3Z0X3RpbWluZyBjdnRbNF07Ci0JfSBkYXRhOworCX0gX19hdHRyaWJ1dGVfXygocGFja2Vk
KSkgZGF0YTsKIH0gX19hdHRyaWJ1dGVfXygocGFja2VkKSk7CiAKICNkZWZpbmUgRURJRF9ERVRB
SUxfRVNUX1RJTUlOR1MgMHhmNwpAQCAtMTcyLDcgKzE3Miw3IEBAIHN0cnVjdCBkZXRhaWxlZF90
aW1pbmcgewogCXVuaW9uIHsKIAkJc3RydWN0IGRldGFpbGVkX3BpeGVsX3RpbWluZyBwaXhlbF9k
YXRhOwogCQlzdHJ1Y3QgZGV0YWlsZWRfbm9uX3BpeGVsIG90aGVyX2RhdGE7Ci0JfSBkYXRhOwor
CX0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgZGF0YTsKIH0gX19hdHRyaWJ1dGVfXygocGFja2Vk
KSk7CiAKICNkZWZpbmUgRFJNX0VESURfSU5QVVRfU0VSUkFUSU9OX1ZTWU5DICgxIDw8IDApCg==
--0000000000007e28af05e01651d2--
