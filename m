Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECBEC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 09:15:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7436E64EC4; Tue,  9 Feb 2021 09:15:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4923464EC2;
	Tue,  9 Feb 2021 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612862149;
	bh=f7I8VFYO1/xZGCKojh0al/Q6VigrmQP1NtWLooJ1JG8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FLBIl3ZlBrko2Qy0lK3pnG9gfHgUIrEzmXsjFoF8HdnY68nDQXO0o6tCcj0t6HbrU
	 j5i3mcW+MBEE51BOJl3NQ54rNwFBzkY+lPkTuhqwyg87rmzyFVBADbc06nL0SpVl8b
	 +0S7BGLfUSb52PZv7ds0qk+e1sbtihr5RJBSUsQCTiox3KD4iHC3Zdv/RXa6txysWe
	 I75s8MKo2qsqxEsOkvO/e0ChE+SZRxmW8eZSpX6yxHiIsYLEfgO+fXiJ+178K2sCMs
	 1/mJv7jmD3Q7eMCSWtLmOoC5czqB19PbGBanvUo1LIXBnWAQ1zbo18GLZAJ7bgd+zD
	 w2lu3T6IC24sA==
Received: by mail-ot1-f52.google.com with SMTP id t25so16882773otc.5;
        Tue, 09 Feb 2021 01:15:49 -0800 (PST)
X-Gm-Message-State: AOAM5301kJjqBkM06O8IVCiUmkbHh0QNhR1e4rrtDNLJtvF4flOazsfq
	Y2wgZbojC7E0c+1vAVq6iFtBRTBEYHaJoAmZ5Xc=
X-Google-Smtp-Source: ABdhPJzCKdL5uwLNsgiJEByxXI2C7OJRcIA5qgQWvO8WZpPO+Twp0vvTJkeQ1SMTBdFB7TKlXxKK6mcA0B2przB/fAQ=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr6555894otb.305.1612862148433;
 Tue, 09 Feb 2021 01:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl> <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st>
In-Reply-To: <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 9 Feb 2021 10:15:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Message-ID: <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, DTML <devicetree@vger.kernel.org>, 
	Marc Zyngier <maz@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 1:25 AM Hector Martin <marcan@marcan.st> wrote:
> On 09/02/2021 08.20, Mark Kettenis wrote:
> I probed writing to i<<28 for i = [0..255], using nGnRE. This reveals
> that nGnRE writes are allowed (i.e. either succeed or error out
> differently) in the following ranges:
>
> 0x400000000 - 0x4ffffffff (apciec0)
> 0x580000000 - 0x67fffffff (apciec1)
> 0x6a0000000 - 0x6ffffffff (apcie)
>
> Which matches the `ranges` properties of the respective apcie devices in
> the ADT.

Right, these are the same ranges that I found in the adt and that Mark
listed in his code snippet, so it seems we all see the same partitioning
of the address space. I also see them reflected in the
/defaults/pmap-io-ranges property in ADT, which seems to have an entry
for every register range that has some mmio registers, along with what
appears to be a bitmask of some attributes, and it clearly shows
the above ranges as having a distinct set of bits from the others
(in little-endian):

 00000000 04000000 00000080 00000000 27000080 65494350
 00000080 04000000 00000080 00000000 27000080 65494350
 00000080 05000000 00000080 00000000 27000080 65494350
 00000000 06000000 00000080 00000000 27000080 65494350
 000000a0 06000000 00000020 00000000 27000080 65494350
 000000c0 06000000 00000040 00000000 27000080 65494350
   ^64-bit address       ^64-bit length            ^ 64-bit flags?

As opposed to e.g.

 0000f002 05000000 00400000 00000000 07400000 54524144
 0000f802 05000000 00400000 00000000 07400000 54524144
 00800021 05000000 00400000 00000000 07400000 44495344
 0000a801 05000000 00400000 00000000 07400000 54524144
00000367 02000000 00400000 00000000 07400000 54524144
...

There is one more entry for the 0x700000000-0x7ffffffff range, which
has yet another distinct bitmask, but does not seem to correspond
to any registers listed in other nodes.

> The first two are obviously the TB3 ports, and have more
> features (three ranges instead of two, presumably IO port ranges are
> supported on those, there's some extra DMA stuff, etc).

The PCI ranges property identifies these as 64-bit prefetchable (0x43),
32-bit non-prefetchable (0x02), and 32-bit pre prefetchable (0x42)
respectively. The third bus only lacks the 32-bit prefetchable range,
that is normally ok. Is this the NVMe host or something else?

None of them have an I/O space ranges though, only memory space.

> So the hardware behavior is to block nGnRE everywhere except in those
> ranges (i.e. the nGnRnE fault takes precedence over other errors, like
> the address not existing at all).

Ok, so if we want this to get encoded in a 'struct resource' flag, the PCI
resources should work just fine as these resources come from the
PCI layer rather than of_address_to_resource(). I think it would be
reasonable here to add something to of_address_to_resource() to
set such a flag if we can find an unused one, and then require the
drivers for this platform to go through devm_ioremap_resource()
or similar.

       Arnd
