Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40481C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 11:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BFC160F8F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 11:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BFC160F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PvQPh7+/mtRa2kUbI5nb0Y2JqU3auQKXBvEWy79tLHU=; b=E1BEpMFQAaLD0B
	Ujim8ECc3GjTkZthVFMUVbidTkEdaolKi8PSAGjxtdnJFDsVEzXAU8zM0PWIb8dZmNS7ErE4iXbua
	1m8JY64h/c63byB2BuVQz4ekf25Pzk0cgVEr7l0F8TyjycOWJfeezMWTlJIDNRmeCYEG9suLqv/q9
	hjst7P4aretzyjlVvV6UXOpZUEzeJZYipxxvdCu+ZiLL0t4QL2r9hTASTVYcqv6Aha5QdkS58841q
	6FEqLYD6glWXfvIly0dNaGy9Tqv03Sxa4KsISInrrK1Z5Cxf7CHE5Una0mxm16WnmH2Xp01yBvgrM
	okzGDga4MUPvM7sHk0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLdp-006nIy-4Z; Fri, 15 Oct 2021 11:44:49 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbLdk-006nHx-Dx
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 11:44:46 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ad48:4534:27c0:db4b])
 by baptiste.telenet-ops.be with bizsmtp
 id 6Bke260020SQF6f01Bkebj; Fri, 15 Oct 2021 13:44:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mbLdd-0053bD-Ns; Fri, 15 Oct 2021 13:44:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mbLdd-004hf4-AR; Fri, 15 Oct 2021 13:44:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.16 (take two)
Date: Fri, 15 Oct 2021 13:44:30 +0200
Message-ID: <cover.1634298094.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_044444_654910_58A25B51 
X-CRM114-Status: GOOD (  16.59  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211015114430.OQ_KughBZUFahQ-6O1R6sCjwEqAviHHJfmnTyX-e0W8@z>

CUhpIHNvYyBmb2xrcywKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNzMyZThl
ZTAzNTFjNTlkZWQ0ZDg4MTA2NDM3YTdhZDFjZmY0Y2I4MzoKCiAgYXJtNjQ6IGR0czogcmVuZXNh
czogcmNhci1nZW4zOiBBZGQgbWlzc2luZyBFdGhlcm5ldCBQSFkgcmVzZXRzICgyMDIxLTA5LTI4
IDA5OjU5OjI2ICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9nZWVydC9y
ZW5lc2FzLWRldmVsLmdpdCB0YWdzL3JlbmVzYXMtYXJtLWR0LWZvci12NS4xNi10YWcyCgpmb3Ig
eW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNmJlODVkYjQwMTM1ZmI1NTg4M2YzNTQ3NmExZWRk
MDBlYjdhOWE2YjoKCiAgbWFpbG1hcDogRml4IHRleHQgZW5jb2RpbmcgZm9yIE5pa2xhcyBTw7Zk
ZXJsdW5kICgyMDIxLTEwLTE1IDA5OjUwOjEyICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSZW5lc2FzIEFSTSBE
VCB1cGRhdGVzIGZvciB2NS4xNiAodGFrZSB0d28pCgogIC0gU1BJIE11bHRpIEkvTyBCdXMsIFNE
SEksIGFuZCBFdGhlcm5ldCBzdXBwb3J0IGZvciB0aGUgUlovRzJMIFNvQywKICAtIFNQSSBNdWx0
aSBJL08gQnVzLCBjYW1lcmEsIGFuZCB2aWRlby1vbiBzdXBwb3J0IGZvciB0aGUgUi1DYXIgVjNV
CiAgICBTb0MsCiAgLSBTUEkgRkxBU0ggc3VwcG9ydCBmb3IgdGhlIEZhbGNvbiBkZXZlbG9wbWVu
dCBib2FyZCwKICAtIGVNTUMsIG1pY3JvU0QsIGFuZCBFdGhlcm5ldCBzdXBwb3J0IGZvciB0aGUg
UlovRzJMIFNNQVJDIEVWSwogICAgZGV2ZWxvcG1lbnQgYm9hcmQsCiAgLSAyIEdIeiBIaWdoLVBl
cmZvcm1hbmNlIHN1cHBvcnQgZm9yIHRoZSBSLUNhciBIM2UtMkcsIE0zZS0yRywgYW5kCiAgICBN
M05lLTJHIFNvQ3MsCiAgLSBNaXNjZWxsYW5lb3VzIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMuCgpU
aGFua3MgZm9yIHB1bGxpbmchCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJpanUgRGFzICg1KToKICAgICAgYXJtNjQ6IGR0
czogcmVuZXNhczogcjlhMDdnMDQ0OiBBZGQgU0RISSBub2RlcwogICAgICBhcm02NDogZHRzOiBy
ZW5lc2FzOiByemcybC1zbWFyYy1zb206IEVuYWJsZSBlTU1DIG9uIFNNQVJDIHBsYXRmb3JtCiAg
ICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjOiBFbmFibGUgbWljcm9TRCBvbiBT
TUFSQyBwbGF0Zm9ybQogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEFkZCBH
YkV0aGVybmV0IG5vZGVzCiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjLXNv
bTogRW5hYmxlIEV0aGVybmV0CgpEdWMgTmd1eWVuICgxKToKICAgICAgYXJtNjQ6IGR0czogcmVu
ZXNhczogcjhhNzc5YTA6IEFkZCBSUEMgbm9kZQoKR2VlcnQgVXl0dGVyaG9ldmVuICgxKToKICAg
ICAgYXJtNjQ6IGR0czogcmVuZXNhczogcmNhci1nZW4zZTogQWRkIENvcnRleC1BNTcgMiBHSHog
b3BwcwoKTGFkIFByYWJoYWthciAoMSk6CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3
ZzA0NDogQWRkIFNQSSBNdWx0aSBJL08gQnVzIGNvbnRyb2xsZXIgbm9kZQoKTmlrbGFzIFPDtmRl
cmx1bmQgKDMpOgogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzlhMDogQWRkIGFuZCBj
b25uZWN0IGFsbCBDU0ktMiwgSVNQIGFuZCBWSU4gbm9kZXMKICAgICAgYXJtNjQ6IGR0czogcmVu
ZXNhczogQWRkIHBvcnRzIG5vZGUgdG8gYWxsIGFkdjc0ODIgbm9kZXMKICAgICAgbWFpbG1hcDog
Rml4IHRleHQgZW5jb2RpbmcgZm9yIE5pa2xhcyBTw7ZkZXJsdW5kCgpXb2xmcmFtIFNhbmcgKDEp
OgogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBmYWxjb24tY3B1OiBBZGQgU1BJIGZsYXNoIHZp
YSBSUEMKCiAubWFpbG1hcCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgIDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2ViaXN1LmR0c2kgICAgICAg
ICAgICAgfCAgIDQwICstCiAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlhMC1mYWxjb24tY3B1
LmR0c2kgICAgICB8ICAgMzMgKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWEw
LmR0c2kgICAgICAgICAgfCAxMzQ5ICsrKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5bTEuZHRzaSAgICAgICAgICB8ICAgIDkgKwogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OW0zLmR0c2kgICAgICAgICAgfCAgICA5ICsKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzltNS5kdHNpICAgICAgICAgIHwgICAgOSArCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kgICAgICAgICB8ICAgODkg
KysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1zb20uZHRzaSAgIHwg
IDI0MCArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMuZHRzaSAg
ICAgICB8ICAgNjMgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9zYWx2YXRvci1jb21t
b24uZHRzaSAgIHwgICA1NCArLQogMTEgZmlsZXMgY2hhbmdlZCwgMTg1MCBpbnNlcnRpb25zKCsp
LCA0NiBkZWxldGlvbnMoLSkKCkdye29ldGplLGVldGluZ31zLAoKCQkJCQkJR2VlcnQKCi0tCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgoJCQkJCQkJICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
