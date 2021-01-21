Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6042C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:15:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68447239D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68447239D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tEv5r4+2YafmTpEi6KAfokXbQLxzZzWPTLNzCQtRWHw=; b=dO/l/Y9nK+3bM7yrwoqvRTnKp
	gwqILaEKsLFLtGRCo5/4eKTqHF4Zg12ZFEKNs31W5KMSXCze26Nvf0e5+7BDz6FOSsZkXzEmdLCk9
	79BibikTViTPZsO3c6tPXqWVOpwZYKbCbUWADB+sXMUhS1dfA+T98SQx09D6XRgtAYrtCY1fo6kzH
	YOk5m7ShzQwKGTG8A16BCdYIYa+1GXag90fVxe+C69hEZf5X/R2V1QpOq9xPtwvqjLXMNgNzcZCyd
	huW53hrK7/u3LZLCq5+pAfPERFsaoA9vO6Tynzm7G1c7xvAcQkx7NKHL/mBbaMk9cDQ9KN7SFi1zB
	tpIxYxUTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2WyD-0002Sl-TT; Thu, 21 Jan 2021 10:13:41 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2WyB-0002SI-Ba
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 10:13:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EBF8522FAD;
 Thu, 21 Jan 2021 11:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611224018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4dLSkqJXtXHKLU0U+8YrniJxd+5nWGvaigg4fV1hAc=;
 b=SaKNVZKxfgcGcg2JHt7BBiGpOI/zUgMnud/Si+cf7OFIUUWbsZUaKmESPwdKR2Iu8A+krE
 fKxfc4D4j84vWKYeiLatvNJ9GKYzRrN6GKvGjXGiWZvHvB2TYRW4dnJi1NkwCOR9Nd2zNX
 H/6+PYgGfZ0RWFUsxIdOsdRXDzHXckc=
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 11:13:37 +0100
From: Michael Walle <michael@walle.cc>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
In-Reply-To: <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
 <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <bd86194a13882ce472764d0c91029e33@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_051339_515033_7044BB55 
X-CRM114-Status: GOOD (  31.88  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121101337.yYhcTqfpYQDXzKV_qQpsgwUyIx2ko7kh1KhEeah-DL0@z>

SGksCgpBbSAyMDIxLTAxLTIxIDEwOjU3LCBzY2hyaWViIE1pY2hhbCBTaW1lazoKPiBIaSwKPiAK
PiBPbiAxLzIxLzIxIDEwOjM1IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBIaSBNaWNoYWws
Cj4+IAo+PiBBbSAyMDIxLTAxLTIxIDEwOjI1LCBzY2hyaWViIE1pY2hhbCBTaW1lazoKPj4+IE9u
IDEvMjAvMjEgODo0MCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+PiBBZGQgc3VwcG9ydCBm
b3IgdGhlIEViYW5nIEVCQVo0MjA1IGJvYXJkLiBUaGlzIGJvYXJkIHdhcyBvbmNlIHVzZWQgCj4+
Pj4gYXMgYQo+Pj4+IGNvbnRyb2wgYm9hcmQgZm9yIGEgYml0Y29pbiBtaW5pbmcgZGV2aWNlLiBO
b3dhd2RheXMgaXQgaXMgc29sZCBhcyBhCj4+Pj4gY2hlYXAKPj4+PiBaeW5xLTcwMDAgZXZhbCBi
b2FyZC4KPj4+PiAKPj4+PiBNaWNoYWVsIFdhbGxlICgzKToKPj4+PiDCoCBkdC1iaW5kaW5nczog
YWRkIGViYW5nIHZlbmRvciBwcmVmaXgKPj4+PiDCoCBkdC1iaW5kaW5nczogYXJtOiBhZGQgRWJh
bmcgRUJBWjQyMDUgYm9hcmQKPj4+PiDCoCBBUk06IGR0czogYWRkIEViYW5nIEVCQVo0MjA1IGRl
dmljZSB0cmVlCj4+Pj4gCj4+Pj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0veGlsaW54
LnlhbWzCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbMKgIHzCoMKgIDIgKwo+Pj4+IMKgYXJjaC9hcm0vYm9vdC9k
dHMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAx
ICsKPj4+PiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtZWJhejQyMDUuZHRzwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAxMDkgCj4+Pj4gKysrKysrKysrKysrKysrKysrCj4+Pj4gwqA0IGZpbGVzIGNo
YW5nZWQsIDExMyBpbnNlcnRpb25zKCspCj4+Pj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm0vYm9vdC9kdHMvenlucS1lYmF6NDIwNS5kdHMKPj4+PiAKPj4+IAo+Pj4gYW55IGxpbmsgd2l0
aCBzY2hlbWF0aWNzPwo+PiAKPj4gaHR0cHM6Ly9naXRodWIuY29tL3hqdHVlY2hvL0VCQVo0MjA1
LCBsb29rcyBsaWtlIHRoZXNlIGFyZQo+PiByZXZlcnNlIGVuZ2luZWVyZWQgKGZyb20gYSBsYXlv
dXQgZmlsZT8pIHRob3VnaC4KPiAKPiBJbnRlcmVzdGluZyBidXQgYXQgbGVhc3Qgc29tZXRoaW5n
Lgo+IAo+PiAKPj4+IEkgd2lsbCBsZXQgZHQgZ3V5cyB0byBjb21tZW50IDEvMyBidXQgc2VyaWVz
IGxvb2sgZ29vZCB0byBtZS4KPj4+IFRoZSBib2FyZCBkb2Vzbid0IGxvb2sgaW50ZXJlc3Rpbmcg
ZnJvbSBkZXNjcmlwdGlvbiBwb2ludCBvZiB2aWV3IAo+Pj4gdGhhdCdzCj4+PiB3aHkgYWxsIHRo
ZSB0aW1lIHRoaW5raW5nIGlmIG1ha2VzIHNlbnNlIHRvIGFkZCBpdCB0byBrZXJuZWwuCj4+IAo+
PiBXaGF0IGRvIHlvdSB3YW50IHRvIHRlbGwgbWU/IFRoYXQgZm9yIHRoZSB0aW1lIGJlaW5nLCBp
dCBkaWRuJ3QKPj4gYXBwZWFyIHRvIHlvdSB0byBhZGQgdGhlIGJvYXJkIHlvdXJzZWxmIC0gb3Ig
ZG8geW91IHRoaW5nIGl0Cj4+IGRvZXNuJ3QgbWFrZSBzZW5zZSBhdCBhbGwuIElmIGl0cyB0aGUg
bGF0dGVyLCB3aGF0IHdvdWxkIGJlCj4+IGFjdHVhbCByZWFzb24gdG8gaGF2ZSBhIGJvYXJkIGlu
IG1haW5saW5lPwo+IAo+IEkgaGF2ZSBiYWQgZXhwZXJpZW5jZSB3aXRoIGZvciBleGFtcGxlIEF2
bmV0IGJvYXJkcyB3aGljaCBwZW9wbGUgYWRkIAo+IGFuZAo+IG5vbmUgaXMgcmVhbGx5IHVwZGF0
aW5nIHRoZW0gYW5kIHRoZXkgYXJlIGluIHRoZSBzYW1lIHN0YXRlIGZvciB5ZWFycy4KCldvdWxk
bid0IGl0IGJlIGJldHRlciB0aGVuIHRvIHB1bGwgdGhlIHBsdWcgYXQgc29tZSB0aW1lIGFuZCBy
ZW1vdmUgCnRoZXNlCmJvYXJkcy4KClRCSCBJIHdhcyBhIGJpdCBkaXNhcHBvaW50ZWQgYnkgeW91
ciBzdGF0ZW1lbnQuIEl0IHNvdW5kZWQgbGlrZSAibmFoCnRoaXMgYm9hcmQgaXNuJ3Qgd29ydGgg
aXQiLiBFc3AuIGJlY2F1c2UgaXQgaXMganVzdCBvbmUgKHNtYWxsKSBmaWxlLgpCdXQgbW9yZSBi
ZWxvdy4KCj4gTG9uZyB0aW1lIGFnbyB3ZSBhZ3JlZWQgdGhhdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ug
dG8gZGVzY3JpYmUgUEwgaW4KPiB1cHN0cmVhbSBwcm9qZWN0cyBhbmQgd2Ugb25seSBkZXNjcmli
ZSBQUyBwYXJ0LiBJdCBtZWFucyB5b3UgbGlrZWx5IAo+IG1pc3MKPiBzZXZlcmFsIHRoaW5ncyB3
aGljaCBhcmUgdXNlZnVsIGFuZCB0aGUgcmVhc29uIGZvciB1c2luZyB0aGVzZSBTb0NzIGlzIAo+
IFBMLgo+IAo+IEFzIHlvdSBsaWtlbHkga25vdyBYaWxpbnggaGFzIFZlcnNhbCBkZXZpY2UgYW5k
IEkgZGlkbid0IHB1c2ggYW55IAo+IGRldmljZQo+IHRyZWUgdG8gYW55IHVwc3RyZWFtIHByb2pl
Y3QgYW5kIHRoaW5raW5nIG5vdCB0byBhZGQgYW55IGRlc2NyaXB0aW9uIAo+IGZvcgo+IGJvYXJk
cyBhbmQgc3RheSBpbiBzb3J0IG9mIHNwYWNlIHRoYXQgInZpcnR1YWwiIGRlc2NyaXB0aW9uIGZv
ciBTb0MKPiBzaG91bGQgYmUgZW5vdWdoLiBNYXliZSBqdXN0IHZlcnNhbC5kdHNpIGFuZCBvbmUg
a2l0Y2hlbiBzaW5rIERUIHNob3VsZAo+IGJlIGFkZGVkIGJ1dCBub3QgZGVzY3JpcHRpb24gZm9y
IGFsbCBib2FyZHMuCj4gCj4gVGhlIHNhbWUgaXMgaWYgbWFrZSBzZW5zZSB0byBwdXNoIGFsbCBE
VHMgZm9yIGFsbCBzdGFuZGFyZCB4aWxpbnggCj4genlucW1wCj4gZXZhbHVhdGlvbiBib2FyZHMu
IElmIHRoZXJlIGlzIHNvbWV0aGluZyBpbnRlcmVzdGluZy9uZXcgSSB0aG91Z2h0IGl0Cj4gbWFr
ZXMgc2Vuc2UgdG8gYWRkIGl0IGFzIHBhdHRlcm4gdG8gZm9sbG93LiBCdXQgZm9yIGJvYXJkcyB3
aGljaCBsb29rcwo+IHZlcnkgc2ltaWxhciBmcm9tIFBTIHBvaW50IG9mIHZpZXcgSSBkb24ndCB0
aGluayB0aGVyZSBpcyByZWFsIHZhbHVlIHRvCj4gYWRkIGFuZCBpbnZlc3QgdGltZSBmb3IgbWFp
bnRhaW5pbmcuCj4gCj4gQmFjayB0byB5b3VyIGNhc2UuIEJvYXJkIGlzIGNoZWFwIHdoaWNoIGlz
IG5vdCBhbGwgdGhlIHRpbWUgY2FzZSBmb3IgCj4gYW55Cj4geGlsaW54IGJvYXJkIGJ1dCB5b3Ug
aGF2ZSBvbmx5IHVhcnQsIHNkIGFuZCBwYXJ0aWFsbHkgZGVzY3JpYmVkIAo+IGV0aGVybmV0Cj4g
d2hpY2ggZG9lc24ndCB3b3JrIHdpdGhvdXQgUEwuIElzIGl0IHdvcnRoIHRvIGhhdmUgdGhpcyBk
ZXNjcmliZWQ/CgpJIGdvdCB5b3VyIHBvaW50LiBCdXQgaXQgaXMgYXQgbGVhc3QgYSBqdW1wIHN0
YXJ0IGZvciB0aGUgdXNlcnMgaWYgdGhhdApib2FyZCBib290cyBvdXQgb2YgdGhlIGJveC4gQW5k
IHllcywgaXRzIHVuZm9ydHVuYXRlLCB0aGF0IGV0aGVybmV0Cmp1c3Qgd29ya3MgaWYgdGhlIFBM
IGlzIGNvbmZpZ3VyZWQuIFRoaXMgaXMgYWxyZWFkeSBkb25lIGJ5IHRoZQpib290bG9hZGVyLCBi
ZWNhdXNlIHRoZXJlIEkgZG8gaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLgoKPiBFc3BlY2lhbGx5IHdo
ZW4gaXQgaXMgdmlzaWJsZSB0aGF0IHlvdSBuZWVkIHRvIGRlc2NyaWJlIGN1c3RvbSBQTCBhbmQg
Cj4gRFQKPiBvdmVybGF5cyBhcmUgbm90IHNvbGlkIHlldC4KPiAKPiBUaGFua3MsCj4gTWljaGFs
CgotLSAKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
