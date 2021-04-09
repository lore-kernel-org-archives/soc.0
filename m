Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC39BC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 05:30:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F9861029
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 05:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38F9861029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gKO0YwP11e9IvAaJ3tEstk8Qu8fevOLYY1LGXRUl2OM=; b=rYCkc96v3YjZY1IEPCXeFtaux
	wYi1Ddv10GGHF0cycivAFptURNamzp2+/aS4FAr/H7vz9udVdSNXHqq3mXCGcjjptbdL2gWaGoj6G
	LYv7Qj01nn84Hi2/jYVyrq8VPQTdfY/7uU8O7yC39JY1hIrelWdpn8EXLpjlBm2FwzuHmjYQXGwjh
	kt9wYRZmAFRKi6bI14tnuNdfjmxdaS0pu8qocG83kFEt7stko2NgophLqeTQbOirAGN+Pkm55EVP6
	Dn3EakgajXGuxVWenYcJEX8OQe6yeUZ/ZcPbUTD/sk31eXpM/BSuUbpKbOdloHFI6017Qrqho7D8G
	iEXWpiZIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUjgv-00A8dT-8o; Fri, 09 Apr 2021 05:28:25 +0000
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUjgd-00A8bS-NE
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 05:28:20 +0000
Received: from player692.ha.ovh.net (unknown [10.110.115.36])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id D1FE8CA9B3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  9 Apr 2021 07:27:57 +0200 (CEST)
Received: from RCM-web3.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 10B651CC96314;
 Fri,  9 Apr 2021 05:27:37 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 07:27:36 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Tony Lindgren <tony@atomide.com>,
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, SoC Team <soc@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: New 'make dtbs_check W=1' warnings
In-Reply-To: <632cbdec-e477-212c-f5a8-81151915fdeb@gmail.com>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <632cbdec-e477-212c-f5a8-81151915fdeb@gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <903fdcef324310c97627ada4bbc77ebb@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 16563395004640431855
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigihgtgfesthejjhdttdervdenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepveefvdetjeffueefkeeuuedvgefhgeegjefgvedvgeeiteduueeivdeltedthfetnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_062816_874962_75573857 
X-CRM114-Status: GOOD (  17.06  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210409052736.awlsuQNTm1Tj31gfJPc5-6K6EhY98EgvAJv89uQUhB8@z>

On 2021-04-09 05:37, Florian Fainelli wrote:
> On 4/8/2021 8:08 AM, Arnd Bergmann wrote:
>> Greetings to all Arm platform maintainers,
>> 
>> I've just gone through the DT merges I've received so far and, with a
>> little help from Rob,
>> managed to run 'make dtbs_check W=1' before and after, to see what
>> warnings we get.
>> The good news is that the number of warnings is going down, but
>> unfortunately there
>> is still an unmanageable amount of remaining warnings, and some new
>> ones crept in.
>> 
>> I'm still working on my tooling for this, to catch these better, but
>> ideally I think we should
>> try to not introduce new warnings. I think some platforms are already
>> clean, and I did
>> not see any new warnings for mvebu, samsung and broadcom. There were a 
>> lot of
>> warnings from .dtsi files, and I probably did an incomplete job at
>> deduplicating those.
> 
> There are definitively a ton of warnings for Broacom DTS files, a 
> number
> of those warnings exist because the bindings were not converted to 
> YAML.
> Rafal, do you think you could help me with taking care of the
> BCM5301X/4908 warnings?

Sure, I got rid of one or two warnings already, I'll keep working on 
that.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
