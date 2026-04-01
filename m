Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE401624D5
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054290; cv=none; b=R5aCgtZkpCzN37ZByi7Bh7zexikE4hH+LR2tqbvPXn6PmnK1CDU5emRBHyU3dTBbDWgXo9/yWeadnOlxQV99V/Vahqcujen8xUwPQFfZoLgJH1rTwPobV7rqy3hbGPG8tPwVCxxRbQerqNySnyZxstrVaSIpEZG1b5gYtuq/tHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054290; c=relaxed/simple;
	bh=xkHESSiaK9BCG07swz+LBZ+vY09R2lx59SFqRaupa0c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ozfcQF4qexVba3n1B61+sWa4uBfTpCWmdQJGo6r30aFACcnzSsB3rk78JlT5IAD6x9erTQHEDxphssoyiYQJl1Q5bTYUpgZEFDXDyayo5KzstTgtReIfzAaVNEth4bQhlB2tDUllZT41yMownjUi3kET3OQ3WTtCy+c/o1/antw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=AmMRWEID; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UbDDVo/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="AmMRWEID";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UbDDVo/U"
Received: by smtp.kernel.org (Postfix)
	id DBF41C2BCB0; Wed,  1 Apr 2026 14:38:09 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCAD2C2BCB2;
	Wed,  1 Apr 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCAD2C2BCB2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E4263EC02EA;
	Wed,  1 Apr 2026 10:38:06 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 10:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775054286;
	 x=1775140686; bh=QbWZktnj9SVaA0UcPrEBNb83BuCCl6SWWSCqMxWbruE=; b=
	AmMRWEIDuVG8FlzSzMniBIBl1/a+uYzrF4spT2t1byEDbhJAtVMmGRP+fNleo4La
	abvHEcr7cdBRiqKxeyq3Pspp/yhOh+Ja6RWlequfppADLK9SQ3qC8TDj7lNgdZxL
	ovANINGOauwCGwGBF3tOhiNU9vt5LlHx4uD6wJdrQIy50cJTiQ2Gbs2inZxIJW6d
	Ti8DpAybtuREh+zrb12ioUgMEAd8C5ZwwOx61QrurS/X6XEdILK7RzJt6oml8Y0D
	w0P81Crm5JgSa2ItGX5Vf0ADDRtQ+91vX31AsPfVx5+FxcHDrFjGB5VCYWhvnZbD
	pYAGLA1g4G0mKQeoRJj7lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775054286; x=
	1775140686; bh=QbWZktnj9SVaA0UcPrEBNb83BuCCl6SWWSCqMxWbruE=; b=U
	bDDVo/UlZC+2WbbgnOAjGzFatFWBCrCwocPf4mOgL2hfJbohhXoFa6oN5T1AFL48
	fURzetkW+4E7M3BQ25IK2Dvz+WZB3utqKQQLwnVlfkiXIbupHsJoeiTaY+qMjvu4
	nbk2O45JR3ocvwnrK0qkLEhRNtyFlsv7NWuzDzzmqe9RaprrcqJSGTm+E6ovLJlH
	dmZbDJn4W72oqjBGh70GR/pWQZIqYiM+McAm1G3YOwBPOkWFKbcgnsm+SaHI01uZ
	nSNd37Un1WiFhFuy1mFYVRL3U5g+/DqL+NsUF03KIOZ3uDiZoX1kFsCS7BK/tPl9
	Zh1boUDVV0zospVnKnRLA==
X-ME-Sender: <xms:zi3NaYOU6A3o1zJkw149u30PTLfR6BydXE_YQic-o2BSq-vPdrlQnQ>
    <xme:zi3NaZzBxz_7hEHtYu6OR9qnoaUai_AMXOnfPZG46ATKTGGR2M_fc1JXzNxXzufvx
    3JsBCahLJnfBUNUgTqr3xHYT6hozJi0OBagjpiAvSHO944lFkuySsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeffeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghroh
    gruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegs
    rhhorggutghomhdrtghomhdprhgtphhtthhopeifrghhrhgvnhhsthesghhmgidrnhgvth
    dprhgtphhtthhopehmtggrnhgrlhesihhgrghlihgrrdgtohhmpdhrtghpthhtohepkhhh
    ihhlmhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrrdhhvghrsghurh
    hgvghrsehlihhnuhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:zi3NaTtzslQiStsyHMdrnMouEt24KcyTfuDUD5QKsKdbConAfcf2sw>
    <xmx:zi3NaXgTW_i50r2BT8sVUhAsmoXzm5A1reU7evG6ekGttXbCkvLhVw>
    <xmx:zi3NaRbyAvGLJltjKhOxOmbpa2G0_CPddjDk08TNFdOtEoZpdKkzgw>
    <xmx:zi3NaeZOC10WBXgD052dgglgdAiLD-nvxEerlHRUX-6k8ovq1ySR9w>
    <xmx:zi3NaXOHF5khfW6xRJhMTdstpm2KrlNhZoXAilPKCDUEXEuMM9TAuadD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8B194700069; Wed,  1 Apr 2026 10:38:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Au-GG9YHiX1s
Date: Wed, 01 Apr 2026 16:37:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, "Rob Herring" <robh@kernel.org>,
 "Gregor Herburger" <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "Stefan Wahren" <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
In-Reply-To: <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 14:02, Krzysztof Kozlowski wrote:
> On 01/04/2026 13:18, Krzysztof Kozlowski wrote:
>> On Mon, Mar 23, 2026 at 12:02:39PM -0700, Florian Fainelli wrote:
>> 
>> I think the same issue was last time and repo is non korg, so nothing
>> seems to improve.
>
>
> Maybe last time I mentioned this only internally or on IRC, so could get
> lost. Please get your key in to the kernel keyring, to solve above. Pull
> is not rejected, but I leave it to Arnd who might have your key.
>
> How to get key signed? Obviously conferences are the easiest way, but
> other is to find people around you or on your travel itinerary via
> ksmap. Eventually many people do video call cross signing, so even
> travel is not needed. I video signed twice, but that was an exception
> because I prefer to meet in person. Kernel wiki has guideline on all
> this, so I am not saying anything new here.

I think what happened is that the key expired. I can see that
Florian is using the same key as the last 113 times, and I see
it has signatures from other developers, but the copy I have
expired in 2024, which probably caused it to disappear from
the keyservers.

this is what I see:

$ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]
      FE4FA16F65261D8BDA57BCBD61579915B563760E
uid                 [ expired] Florian Fainelli <f.fainelli@gmail.com>
sig          DE95E6B5B9FA86CB 2008-09-16  Florian Fainelli <florian.fainelli@openpattern.org>
sig          9B1F67D46FF7D7AB 2008-09-16  Florian Fainelli <florian.fainelli@telecomint.eu>
sig          F91A73ED49C617B5 2008-09-16  Florian Fainelli <florian@minet.net>
sig          972BE49811AD8F26 2008-09-16  Florian Fainelli <florian@openwrt.org>
sig 3        61579915B563760E 2008-09-16  Florian Fainelli <f.fainelli@gmail.com>
sig 3        61579915B563760E 2014-11-09  Florian Fainelli <f.fainelli@gmail.com>
sig          3A8F3B2F5A7C9849 2016-03-12  Michael Turquette <mturquette@baylibre.com>
sig          E6BF0DCBA6694C84 2017-04-08  Andrew Lunn <andrew@lunn.ch>
sig          987E58D467ED50B8 2017-04-09  [User ID not found]

       Arnd
