Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3600C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 09:17:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8664D64EBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 09:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8664D64EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q67IK0yCzH2gijXT+lweyWyXHK2dQG0EfOU+VVZqt6I=; b=sXQZoehqWW2tznwSUi+yRAW9E
	ycpQZ+q6H4b1eXg4BWitqGJ4hZOLyJGPMhdU8yTtWCiofstVTgxCZzg2jiasWF93oKIzP6D2M5m37
	pUd6i4zpd+Zs9IEOUoU9P6oE+yJ89k7tXtwolhGdwx7e4zUHipnB4dvmknKYCSoMXFQRP4nKAqHkl
	crt+WjNvn9kyDDIj1S+M+b1pm409LhBdnJsuQivDBn0XXD2e4/2NlkLP5tocTS+6KH4MWywPnlrQp
	SdDR7oe1dfEAPGLw1GNrO/PMe8gflGZaaxinT+N75mta+Zv6nRn8wHCmCEF1jKYzM7ytyn0tDy7TZ
	vAUW7FVpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9P7g-0003LN-Rb; Tue, 09 Feb 2021 09:15:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9P7d-0003KR-Ux
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 09:15:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3453C64EBA
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-ot1-f44.google.com with SMTP id q4so7206751otm.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 01:15:49 -0800 (PST)
X-Gm-Message-State: AOAM5331g3uswEDsNXYmg9sW9h0M+UBHhPdUJkD37Qcmp7VtbUULJ8mo
 foHBro31lSrmbZ6NTTbKRS5BrJC0tR/XB1PKfJs=
X-Google-Smtp-Source: ABdhPJzCKdL5uwLNsgiJEByxXI2C7OJRcIA5qgQWvO8WZpPO+Twp0vvTJkeQ1SMTBdFB7TKlXxKK6mcA0B2przB/fAQ=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr6555894otb.305.1612862148433; 
 Tue, 09 Feb 2021 01:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl>
 <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st>
In-Reply-To: <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 9 Feb 2021 10:15:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Message-ID: <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_041550_151766_E4103D00 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209091531.799X0zJuwPuo_ri7Pjz1moCCec0abPjg-D45tjJJtNE@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
