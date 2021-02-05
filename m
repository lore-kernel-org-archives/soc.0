Return-Path: <SRS0=eMXW=HH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA27C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 07:13:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D483C64FB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 07:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D483C64FB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rtlqm4Tk5CoAMCBuq/tJfCsvJeiiplFE8u/ChO4lJvo=; b=HJUnejigBsM63N5nNRtKIc++D
	mTjdFJHfU1XJYQNYYfCykjDhjiFudAX8SxNt2W6HNe1yvuNhIZFrdtTqQnOVvfvEJ/P2JqEMxVVQX
	g6gy39B22g4tYOXaulO7oIePbOYebpivuf8ntGGNEUfhz0LbxJgaxZNiNWbCu2ECtyV3yDlkwrwcT
	XU1kMElyM/WZoqwc3h0HF51ciXN9aYljlSuqWF7kal9XkQ0v+5/XRSTaCBbxUVlgJuhEIDVV5PuLn
	CjSd0F1kD5i3pmbv5bM/VAdk6lpFDYsVlXvxbaKrnXrfv64pjIyZIEIZkCriXv7tRPbe5NIceleYO
	QqS4LXjtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vHf-00060G-Lc; Fri, 05 Feb 2021 07:12:03 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vHc-0005zH-Rb
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Feb 2021 07:12:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 857B5423AD;
 Fri,  5 Feb 2021 07:11:55 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
 <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
 <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <3f2001f0-4a90-645e-d016-03907228dc7a@marcan.st>
Date: Fri, 5 Feb 2021 16:11:53 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_021201_016931_7BA4AB96 
X-CRM114-Status: GOOD (  20.01  )
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
Message-ID: <20210205071153.H3QBfA_OF3uRZgRxtk97GhX-tTjuOvPbzGRPi5lM4gk@z>

On 05/02/2021 08.08, Arnd Bergmann wrote:
> On Thu, Feb 4, 2021 at 10:44 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
>> On 05/02/2021 06.29, Arnd Bergmann wrote:
>>> On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
>>>
>>> We tend to split the dts file into one file per SoC and one for the
>>> specific board. I guess in this case the split can be slightly different,
>>> but it does feel better to be prepared for sharing a lot of the contents
>>> between the different products.
>>>
>>> In most cases, you'd want the 'aliases' and 'chosen' nodes to be
>>> in the board specific file.
>>
>> I thought about that, but wasn't sure if splitting it up at this early
>> stage made much sense since I'm not sure what the split should be, given
>> all supported hardware is the same for all 3 released devices.
>>
>> I'm happy to throw the aliases/chosen nodes into board specific files if
>> you think that's a good starting point. Perhaps /memory too? Those
>> properties are filled in/patched by the bootloader anyway...
> 
> Yes, I think that would help make it more consistent with other
> platforms even if we don't care too much here.

Ack, I'll split it up for v2.

> We don't really have overlays in the kernel sources (yet), though it
> is something that keeps coming up. For the moment, I'd just
> assume you can have one .dts file for each thing you want to
> support and keep the shared bits in .dtsi files.

No problem. We'll experiment with overlays in m1n1 and see how that goes.

One thing I wanted to ask: is there some kind of "experimental" policy 
for DT bindings? At early platform bring-up stages it seems like it 
could be valuable to allow for breaking DT changes while we flesh out 
the details (this is especially true of a reverse engineered platform 
like this, where we don't have knowledge of all the hardware details a 
priori). The dozen or so users we might have at this stage obviously 
won't complain too much :)

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
