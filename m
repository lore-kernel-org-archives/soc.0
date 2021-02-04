Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAAFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:45:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 907E464F8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 907E464F8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bO7PmgbN2el1InMvYp92kdxseJEYTZGaeMC+WggQNY0=; b=u2AcDbsMnJylj1d6MWRefEuWQ
	1eXLg9OqdXx3fNLafBGo+lNeWVe61yHtmErIT4Ac93qx0a7K3/9Mkvx4mu0om1FRLPvzlBQo2s45D
	Gtp5v9Jl/6+OQn+/4JXjFbPets3kBtut4rSVTYJlOSkduBRKdIzl2vDgVfcNTdh8aZVLKz0G7ZMFC
	o9vDgHIB8RIU1CK07b419PqfKh6XqZZFVwT1i7KWOfBcSMuW2JzDHZ/sE6Bf1Qh12IRNVljg1OU4W
	j6o2CiksRzLkNmK/XLdEG1uTa7JpnVLseJ3V7T5cdcydvRpWTBnbiWn9Z3q3/9D2KEQmyONF/CmFL
	cHkAPZqMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7mQJ-0006eY-Ug; Thu, 04 Feb 2021 21:44:24 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7mQH-0006eA-Df
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 21:44:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 2DF0C425B6;
 Thu,  4 Feb 2021 21:44:14 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
Date: Fri, 5 Feb 2021 06:44:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_164421_704950_F7CB86CE 
X-CRM114-Status: GOOD (  33.15  )
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
 Olof Johansson <olof@lixom.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204214413._856SCQRrhMWGZC9YK4UBmfDTj0Pk9Ov__uReuv7yKg@z>

On 05/02/2021 06.29, Arnd Bergmann wrote:
> On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
> 
>> +/ {
>> +       model = "Apple Mac Mini M1 2020";
>> +       compatible = "AAPL,j274", "AAPL,m1", "AAPL,arm-platform";
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       chosen {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               bootargs = "earlycon";
>> +               stdout-path = "serial0:1500000";
>> +
>> +               framebuffer0: framebuffer@0 {
>> +                       compatible = "AAPL,simple-framebuffer", "simple-framebuffer";
>> +                       reg = <0 0 0 0>; // To be filled by loader
>> +                       // Format properties will be added by loader
>> +                       status = "disabled";
>> +               };
>> +       };
>> +
>> +       memory@800000000 {
>> +               device_type = "memory";
>> +               reg = <0 0 0 0>; // To be filled by loader
>> +       };
>> +
>> +       aliases {
>> +               serial0 = &serial0;
>> +       };
> 
> We tend to split the dts file into one file per SoC and one for the
> specific board. I guess in this case the split can be slightly different,
> but it does feel better to be prepared for sharing a lot of the contents
> between the different products.
> 
> In most cases, you'd want the 'aliases' and 'chosen' nodes to be
> in the board specific file.

I thought about that, but wasn't sure if splitting it up at this early 
stage made much sense since I'm not sure what the split should be, given 
all supported hardware is the same for all 3 released devices.

I'm happy to throw the aliases/chosen nodes into board specific files if 
you think that's a good starting point. Perhaps /memory too? Those 
properties are filled in/patched by the bootloader anyway...

There are also DT overlays; I was wondering if we could use those to 
keep the hierarchy and avoid having many duplicate trees in a 
hypothetical bootloader that embeds support for a large set of hardware, 
having it construct the final devicetree on the fly from SoC + a board 
overlay (and possibly further levels); but I'm not sure how that ties in 
with the device trees that live in the Linux tree. Do you have any 
pointers about this?

For reference, this is our current DT patching code in m1n1:

https://github.com/AsahiLinux/m1n1/blob/main/src/kboot.c

Eventually we're going to build some kind of tooling to automate diffing 
Apple device trees and importing changes/new devices into our own, 
though it will probably be quite a while until that is relevant; at this 
stage hand-maintaining them is perfectly fine (in any case this wouldn't 
be fully automated, so in the end our trees will still be organized 
however we want).

>> +       cpus {
>> +               #address-cells = <2>;
>> +               #size-cells = <0>;
>> +
>> +               cpu0: cpu@0 {
>> +                       compatible = "AAPL,icestorm";
>> +                       device_type = "cpu";
>> +                       reg = <0x0 0x0>;
>> +                       enable-method = "spin-table";
>> +                       cpu-release-addr = <0 0>; // To be filled by loader
>> +               };
> 
> Did you see the discussion on the #armlinux channel about the possibility
> of moving the cpu-enable method to PSCI based on a UEFI runtime
> interface?
> 
> There are a few open questions about what that would look like in the
> end, but Ard has come up with a prototype for the kernel side of it
> (obviously untested), which would interface either into the UEFI side
> of u-boot, or a simple already-instantiated version that could be
> kept inside of m1n1 and stay resident in memory.
> 
> I would like to see that model get adopted here eventually. If
> we manage to get the other patches ready for an initial merge in
> v5.12, we can probably start out with spin-table and move to that
> in a following release though.

I saw it go by but need to review it again; I've been missing too much 
sleep this week :) thanks for the reminder.

I think we might want to start with spin-table for now, given that there 
are no kernel changes needed anyway, but I'm happy to take the protoype 
for a spin (:)) and try implementing it in m1n1.

I do think it's valuable for whatever we do, at this stage, to not 
require u-boot; having that be an integral part of the boot chain is 
perfectly fine in the future but right now it helps to have a simple 
boot chain while we work out the early bring-up, and while u-boot grows 
the required support.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
