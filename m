Return-Path: <SRS0=Uu9Z=I7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A63C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 20:39:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0385A61155
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 20:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0385A61155
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1l/W6/zB0zzjtIrrbrg5IvvlSgIIWk6SvvhdePRwHfM=; b=VTYuKv8mI2EWCGHusAqAkQiick
	K0xmoXno3fx9o/Z+TlT5ZoV8TGyEGJy89NeigOWL5eBaVoq90AmkMscQax5fSo0hYHdtfZiZMNPBv
	aCFje3sx87VaM6OfjlJwMPfBAQpdFTY7s/UyVg45Wv8VjpXwC7f0WFuNqJOKnM3IGandFHuexkPNt
	RrRLqGtE2SqgUhnbz9/ULQ7pBU3r7aBcHuNV7DwvCm9WJolCUqbjkzPiytg1iqE1RTW7qsUCaLmwG
	tPSX/8KW6RgG+nErKl2fp/6PvuPlGauuCFYTX7hKJvuBVY1WK7SKhvW59mKr63z/m999BZIkMSyWT
	FUwEwCFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSQY2-00DoKT-Jw; Fri, 02 Apr 2021 20:37:42 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSQXv-00DoKA-Nw
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Apr 2021 20:37:37 +0000
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3CE591C0003;
 Fri,  2 Apr 2021 20:37:31 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.12 (#1)
Date: Fri, 02 Apr 2021 22:37:30 +0200
Message-ID: <87a6qgctit.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_213735_901337_F8B6520C 
X-CRM114-Status: UNSURE (   8.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210402203730.lCtuSqsFffzUxQFsFT8ugPQYEiQhQTHa14o-pFpe6Lw@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGZpeGVzIGZvciBtdmVidSBm
b3IgdjUuMTIuCgpHcmVnb3J5CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGEz
OGZkODc0ODQ2NDgzMTU4NGExOTQzOGNiYjMwODJiNWEyZGFiMTU6CgogIExpbnV4IDUuMTItcmMy
ICgyMDIxLTAzLTA1IDE3OjMzOjQxIC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9nY2xlbWVudC9tdmVidS5naXQgdGFncy9tdmVidS1maXhlcy01LjEyLTEKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhMjZjNTZhZTY3ZmE5ZmJiNDVhOGEyMzJkY2Q3ZWJhYTdh
ZjE2MDg2OgoKICBBUk06IGR0czogdHVycmlzLW9tbmlhOiBjb25maWd1cmUgTEVEWzJdL0lOVG4g
cGluIGFzIGludGVycnVwdCBwaW4gKDIwMjEtMDQtMDIgMjI6MTQ6NDQgKzAyMDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cm12ZWJ1IGZpeGVzIGZvciA1LjEyIChwYXJ0IDEpCgoyIGZpeGVzIG9uIG9uIHR1cnJpcy1vbW5p
YSAoQXJtYWRhIDM4eCBiYXNlZDopCiAtIEZpeCBzdG9ybSBpbnRlcnJ1cHQKIC0gRW5hYmxlIGhh
cmR3YXJlIGJ1ZmZlciBtYW5hZ2VtZW50IGFzIGl0IHNob3VsZCBiZQoKVW5icmVhayBBSENJIG9u
IGFsbCBNYXJ2ZWxsIEFybWFkYSA3azhrIC8gQ045MTN4IHBsYXRmb3JtcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHcmVn
b3J5IENMRU1FTlQgKDEpOgogICAgICBSZXZlcnQgImFybTY0OiBkdHM6IG1hcnZlbGw6IGFybWFk
YS1jcDExMDogU3dpdGNoIHRvIHBlci1wb3J0IFNBVEEgaW50ZXJydXB0cyIKCk1hcmVrIEJlaMO6
biAoMSk6CiAgICAgIEFSTTogZHRzOiB0dXJyaXMtb21uaWE6IGNvbmZpZ3VyZSBMRURbMl0vSU5U
biBwaW4gYXMgaW50ZXJydXB0IHBpbgoKUnVpIFNhbHZhdGVycmEgKDEpOgogICAgICBBUk06IGR0
czogdHVycmlzLW9tbmlhOiBmaXggaGFyZHdhcmUgYnVmZmVyIG1hbmFnZW1lbnQKCiBhcmNoL2Fy
bS9ib290L2R0cy9hcm1hZGEtMzg1LXR1cnJpcy1vbW5pYS5kdHMgfCA0ICsrKy0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtY3AxMXguZHRzaSB8IDYgKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIApHcmVnb3J5IENs
ZW1lbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRw
Oi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
