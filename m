Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B42C42E404
	for <soc@lists.linux.dev>; Fri, 21 Aug 2026 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330456; cv=none; b=IlyuU99cK3QC6wvHkMJ3xHXBuPY2pcjejOWYUng7TcfuG5saIvX3wgbwAkRFHAAhAusgQqanIGnpaobYh0MQVoe343oB+Swmch52uXccdxuEJrsCQyiU65UZT1T4xkrkKghf+H0u50Wq970oL6xnyEQIxp35XWb3HyLKBuXrpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330456; c=relaxed/simple;
	bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmUe9yfmPigvZPcMOxql+Wkg/BCYXijZSx5FLfDPUgtm5hNTMdMCbwFXbYxJUov2IplUL0S9LZXNsg/5xQUq0vufDRHWC9WIn8UH3Pvz7WEc++LMxnbxw8dNvxXj1qB8KmLCE6nuySE3DTICzbpmizH/bGlWZSaZ+dRkgo8FKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f05QrYWw; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f05QrYWw"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so793726e0c.3
        for <soc@lists.linux.dev>; Fri, 21 Aug 2026 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787330452; x=1787935252; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=f05QrYWwekI9b327rQm312zHh/46413OnTV/Qj3tQnl+0zf0q/9I/JAzclb0NrJC8/
         EcvEVqKQ4ohNXeUjHpe7ByFa6J89fYaauwfGJTSF8J9ZVGQqkqlwUbbI1owrPF78BgLG
         WxUCY1NK9faS9C95JDauamTGHqE65QZu2W9N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787330452; x=1787935252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXeo8EI+t7/t3ez1NovFOGBbAko3PEvsb48iBmoNbLk=;
        b=ELHFNN84wvcGSZf3zTgsq9WqZM0zRKvw/OlVY6NicQxNdjFlVxH2Szf3qTv2umZUgZ
         bH7JDb3PTbo/zyyF2fzYXD8KFfSW5KTQ73MEF/+AUFIm6etOdJ3ppD6+gWvcOJBq2Iu4
         Z+Ik5OuqU2+35A44aH3zGVoQ98FFHXqL8ZNnzWfqNHhDe3MVb+GKgCb4EdL032Ibzi64
         MBAGpMHBnNR1EbT2MsD6uvWCcejlNsvQqIbSBRjgANbSHbS5ByPpCa6HEZEHA5CC5QxH
         BbWNhtbY3NYJ5mOPPFxp7flUHqaY0muJ/1ri+0qB4A8AgbYSFfCJkt0s4VOzXuoKCNsq
         +emQ==
X-Forwarded-Encrypted: i=1; AHgh+RpylTd/rvv8VC8K0etiQST73CVT3v0Lj6HNjSbFwmHM7t4LRPOsWhFPlhNQsiox25yZBOA=@lists.linux.dev
X-Gm-Message-State: AFuF++mBy3an43dsIHe9eZ2kBQjXKOqX8FA9/5aVtX7CK/nBPQ224MZO
	1Fy+0hHOpbbLnL0y3IyiJ2qmBvr8/Cka2w6+UCuwU4ke4xMt9Rzyf9T5dwlM6ttbkIjsoQIMqBv
	viBY=
X-Gm-Gg: AR+sD13sZwcXBBKGkwyKOZMb1ES7R9Ei+uxuIacSgzdNJPvZ6H2xS+4mDbSTTRbcNbk
	Lo3AwZBqEwGgsumw1h4I5cDeA9h5CMiZ6Ys+SiWW0AdyUuO6qbi5PMbF+58IyTwmtcqrapSFSGm
	ddoQ01aTQJ6ElJPPGusWc5p70Z+e3/GyfMTvqk2Vu9k/9DoZ2njYQHxQt1M4E+T9Pt71WXjySdi
	ltNn9jCQuQuiTqpxDebqfBqpHF6SGFwP3d2g3BiDCmI9js8BGcVs1y3LWk4eE278oz2lvGnapcn
	HQGAPhQk8XN4ONN6vudBhPYG0sfXAC6iX+4VjsDobnbJyfzRoalOfB0tLGD31Th3ndsaidjmkii
	6l8uU80Ka6LzTbMgBmTu23S6LnrNNjeSbcHGwIGntjZ1c8QUYQyoMFKwNxDrO/uCqIlAB85rMcg
	AlFfE55RJus1uUc32tfPz7EwlyziiVptfG9q5ZOXORF59XgGC7cwf6vUOxL8IYAdL0z7OixUAcv
	mfFz4la9yjQQ0awcjXiiUCgs8Ohmqo=
X-Received: by 2002:a05:6102:5f04:b0:778:699b:a948 with SMTP id ada2fe7eead31-77a605ed50emr3000383137.2.1787330452139;
        Fri, 21 Aug 2026 09:40:52 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dafa9b1dsm9102683137.1.2026.08.21.09.40.50
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso1048531e0c.2
        for <soc@lists.linux.dev>; Fri, 21 Aug 2026 09:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqUdSKRYxeNgw5UrcsvYTD/LJ4oS6s8xsJHRD4b3MCfDY2/rQXVrzppnwWEynb362NFZ+8=@lists.linux.dev
X-Received: by 2002:a67:c996:0:b0:77a:9991:5d08 with SMTP id
 ada2fe7eead31-77a9991cec1mr1941674137.9.1787330449569; Fri, 21 Aug 2026
 09:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org> <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org> <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
 <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
In-Reply-To: <d6685094-b241-415e-9e56-d2fba75f3269@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Aug 2026 09:40:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
X-Gm-Features: AcwNN1WVXS8N4-UYjDXHL5iUmkkapXer1429A5JjKjwhm2wT5WS30SWZHssAmw4
Message-ID: <CAD=FV=WPu5tuWA7MhC=48r=1uP3LK6hSqY7Egy=56V1Dqq1wRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 20, 2026 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>> I think I've presened my problem fairly concretely [1]. If you hate
> >>
> >> There is no description of the problem at [1], except "bootloader adds
> >> the same type of calibration data".
> >>
> >> So I repeat my questions: to every UFS node? To every node? To one UFS
> >> node (but how do you guarantee that?)?
> >
> > I'm sure it's not what you want to hear, but I guess my answer would
> > be "for these boards".
>
> No, the question is how many aliases you need. Devices might have more
> than one UFS storage, e.g. ExynosAuto.

How many UFS aliases do I need for this board? The answer is in the
patch that started this whole discussion: one UFS alias.


> And then someone might need to calibrate UFS and SPI NOR storage? And MMC=
?

Not for this board.

If you're asking about all future boards, of course they may have
other things to calibrate / tune. My point is that the contract here
is between the bootloader that will be run on these boards and the
device tree that will be run on these boards.

FWIW: the idea of a bootloader using an alias to find a node is not
something I invented. Coreboot (the upstream, open-source project)
uses "wifi" and "bluetooth" aliases to find nodes on Chromebooks. It
uses these aliases to place MAC addresses (which are stored by
manufacturing outside of DT) into the DT nodes (where bindings expect
them). Perhaps coreboot is doing it wrong, but this concept isn't new,
and I didn't invent it.


> > I'm not quite clear on the "overlay" suggestion here. You're saying
> > that we should require the base device tree to be compiled with "-@"?
> > ...and not because we necessarily have any overlays upstream, but
> > because the bootloader will generate an overlay dynamically? Compiling
> > with "-@" would mean we could give a "ufs:" label to the UFS node and
> > with "-@" that would be preserved. The bootloader could then use the
> > "ufs:" label to find the node. When compiling with "-@", the exposed
> > labels are essentially ABI. Did I get that right?
>
> I am saying that if you cannot answer my questions earlier (and you did
> not)

I'm still not quite sure which question I didn't answer, but I guess
at this point it doesn't matter.


> thus this should be treated as adding calibration to multiple
> random nodes, then essentially you are reimplementing overlays and this
> won't be accepted. Instead you should use overlays.
>
> "-@" will give you the labels in __symbols__ section, but it won't be
> treated as ABI because it is not feasible. No one would remember which
> boards have @ and which don't thus which labels are needed externally.
> Only a comment in DTS code would prevent it from being changed.
>
> Well, same for aliases honestly. There is no tool which would guard that
> ABI.

Given the above response, I'm a bit baffled how "use overlays" helps.
Each individual board will have different calibration data. It's
presumably stored in something like an EEPROM on the device. The
firmware is getting this data out of the EEPROM and putting it in the
device tree. This puts the calibration data somewhere the Linux driver
can easily find it. This means any "overlay" would need to be
dynamically constructed for each device by the firmware. In order for
this to work, there has to be _some_ guarante that the firmware can
use to find the UFS node and add the calibration data.

You are saying: "no, there isn't."

I suppose one answer here is that the UFS driver in Linux could get a
phandle to a "NVMEM" device and read it directly. ...though it might
not have permissions.

I suppose another answer here is that the UFS driver in Linux should
somehow figure out how to directly query the firmware for the info.
That seems unnecessarily convoluted, though.

...so I guess the answer is: time to hardcode the path in the
bootloader (shhh, don't tell the DT maintainers) and end this
fruitless conversation.

-Doug
