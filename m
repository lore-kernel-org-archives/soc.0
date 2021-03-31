Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB96C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 22:09:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1698460FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 22:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1698460FEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cfe3tYCi6sFIu5evtO+JnWOvJduARWYozhhBt75YKqg=; b=fT+ePNOZDgWipViw+zN1cjLSJ
	abKGus/0790kfuBc/cl0bMuO8rDwmUS8fQy5IjwIMscTi2O9DYJJgBpHc3Jg8G8PSWBr5GZbR+9k4
	+kNb9U4Dz7XLw/srLbiztu+ITMzslqAyWOVsz2jHf4rZE7z2CM32b5bRc4yOfaDSLMrpNslrWZYAg
	JA4oFLJYA6Cgf8Ny7zcsCxzXIov+eCFrZZaJ46vQsrVr/M2Lp2jom2SDauIzgayXlEPgn2ccfSVxn
	7qPZ1zb/A32ebTTAGpeuZcGmO7hBmQ1CUdE6qcYPQb2lt7vjA7X1agqDxEPwnDE6xI5nlj62V+Y7B
	omEzyKKyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRizT-007nNw-PK; Wed, 31 Mar 2021 22:07:08 +0000
Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRizP-007nNH-Fv
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 22:07:05 +0000
Received: from player773.ha.ovh.net (unknown [10.110.171.96])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 6B2F619384D
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  1 Apr 2021 00:07:01 +0200 (CEST)
Received: from RCM-web7.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 75A0C1CBC9FFC;
 Wed, 31 Mar 2021 22:06:53 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 01 Apr 2021 00:06:53 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
In-Reply-To: <c71b8949-b709-cb5b-b5a4-87cebf8cd8df@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
 <c71b8949-b709-cb5b-b5a4-87cebf8cd8df@gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <213cdda3ff9ab8fba6fc840bfcb57383@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 17475092454633672431
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhephefgudfhuedtuddvfefghfekiedvtdeffeejtdfgudefieffkeegvdevheefhfdvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_230703_782355_2894EAC2 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMy0zMSAyMzo0OCwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiBPbiAzLzMxLzIx
IDI6MzYgUE0sIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gT24gMjAyMS0wMy0zMCAyMDo0MCwg
RmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQKPj4+IGZlMDdiZmRhMmZiOWNkZWY4YTRkNDAwOGE0MDliYjAyZjM1ZjFiZDg6Cj4+PiAK
Pj4+IMKgIExpbnV4IDUuMTItcmMxICgyMDIxLTAyLTI4IDE2OjA1OjE5IC0wODAwKQo+Pj4gCj4+
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4+IAo+Pj4gwqAgaHR0
cHM6Ly9naXRodWIuY29tL0Jyb2FkY29tL3N0YmxpbnV4LmdpdAo+Pj4gdGFncy9hcm0tc29jL2Zv
ci01LjEzL2RldmljZXRyZWUKPj4+IAo+Pj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IAo+Pj4gZGNiNTZkNjFkNWE4YWNjYTBhMzU3Y2M2MDMzOTdiYzAyNzJjZTRjYjoKPj4+IAo+Pj4g
wqAgQVJNOiBkdHM6IEJDTTUzMDFYOiBTZXQgTGlua3N5cyBFQTk1MDAgcG93ZXIgTEVEICgyMDIx
LTAzLTI5Cj4+PiAxMTo0Mzo0NSAtMDcwMCkKPj4gCj4+IFRoaXMgb25lIHNlZW1zIGEgYml0IGNv
bmZ1c2luZy4KPj4gCj4+IENvbW1hbmQ6Cj4+IGdpdCBsb2cgYXJtLXNvYy9mb3ItNS4xMy9kZXZp
Y2V0cmVlCj4+IHNob3dzIG1lIG9ubHkgMiBvZiBtZW50aW9uZWQgY29tbWl0cwo+PiAKPj4gV2Vi
IFVJOgo+PiBodHRwczovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXgvcmVsZWFzZXMvdGFn
L2FybS1zb2MlMkZmb3ItNS4xMyUyRmRldmljZXRyZWUKPj4gCj4+IHJlZmVyZW5jZXMgZGNiNTZk
NiBidXQgb3BlbmluZyBpdCBzaG93cyBwYWdlIHdpdGggYSB3YXJuaW5nOgo+PiAiVGhpcyBjb21t
aXQgZG9lcyBub3QgYmVsb25nIHRvIGFueSBicmFuY2ggb24gdGhpcyByZXBvc2l0b3J5LCBhbmQg
bWF5Cj4+IGJlbG9uZyB0byBhIGZvcmsgb3V0c2lkZSBvZiB0aGUgcmVwb3NpdG9yeS4iCj4+IAo+
PiBNeSBndWVzcyBpZiB5b3UgZGlkbid0IHB1c2ggeW91ciBsb2NhbCBkZXZpY2V0cmVlL25leHQg
YnJhbmNoLgo+IAo+IEkgZGlkIGFuZCB0aGVuIG92ZXJ3cm90ZSBpdCwgaXQgc2hvdWxkIHNob3cg
dXAgY29ycmVjdGx5IG5vdy4KCkkgdGhpbmsgeW91IGp1c3QgcHVzaGVkIGRyaXZlcnMvbmV4dCBp
bnN0ZWFkIG9mIGRldmljZXRyZWUvbmV4dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
