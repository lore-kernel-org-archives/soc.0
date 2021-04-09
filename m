Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC75CC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 06:57:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3366960FD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 06:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3366960FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qVcL1YazJa1qf7pPrWKTCYbf5oE7gfVWWK1YNT5NbPM=; b=jHT7Y/01YKBO4sd0gHPInQsr6U
	QALXx9gWiXm1c+KSJNX2XkBw0GNU2zZabOiCnzv5UZhMhfQltXZwM3qwpmdxefA8259rLufv7Ahnc
	1wiCZtdNPVjtk48DPvM26psTGYvkLb45dAcjh5XmU7Y9ae37zpLJtVjE8SwQtl4QQgmfvacXZOD+o
	sXRUdgn4BdIal1ZKu02niokftPOsqsJBoiMaYmuRmItSvPMg0yxE9CHGFG+w97i3TRmY7qYxifR7t
	TVZ+89gFUtXrbx4pgNzpsjdTtzQA2x3R415SztVK3lhgFJfgjJTDjzx8trLKelEeXgia1LKkQ/vwR
	jlLSIheA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUkze-00AKhu-Aj; Fri, 09 Apr 2021 06:51:50 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUkue-00AJoa-Ph
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 06:47:28 +0000
Received: by mail-qt1-x82f.google.com with SMTP id i19so3457029qtv.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 23:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=Fk+SLvQByxpVgF9nXnK+sGfyXWmk8mqqM5Z9mDGSXkM=;
 b=nQOrPXAP/rlXJIGMD67uNpaC5fSCWPVHu39ALGm7WV4Dnt2JXgbUa87Gj5jf+BptHR
 JlBiR9daoFIXRJoqnqwHoeGl8k5ddLFoYeFpisFVWS5PkThNBdGiqHDSv4yj/JkvJDlY
 F4MWHsFZ7pJznA1OX5VI8A3USTLnvksfeu7b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=Fk+SLvQByxpVgF9nXnK+sGfyXWmk8mqqM5Z9mDGSXkM=;
 b=t7b0KpIq00/Asy7FEt/jSEOMH16KEDkZ1qDMiggePY/R8mAv+UVV+GRsoXOGVOpU1/
 eexoSg0a5TfVDwcIibl9LNhE4n+uIe5qDAV+Fn4XNU6JP/AD1+o6005HjMNPr6WWGBmI
 7isKCQuNXchSETaMF1UHvDug+LvcEULbvu4fPF00lgTUen8B+iIccIvwaQWMs40vVTFu
 zSGEkc2h0vbfF4ZyhkULO17D0m9cbhsyhnkwey/HkFMIPqim8BDB8QjhVfQnzhz4O7hs
 XhOMNvlA+ZRUiyLuNgZydAzqey8Ezoi8J8wyVUcn9OZOalCyazSAkDFQ9FCRYr7zPeNE
 ZrSg==
X-Gm-Message-State: AOAM531/loPaOHRau9sizntLPlaxFBVhWA/iXyLxP41B+Irlo0C+cOLB
 7HWY3EGWMagkO+kY6zV/Vt3SEJMVvYEbwUCBEJM=
X-Google-Smtp-Source: ABdhPJyOK1IoEN8R85hTcPiUd7XO74Y6XVEax2g5xYbXraGJzUecQnp5eFR8XWNCzxuAlQ3ltLYwd23fyAcCPakT7Xk=
X-Received: by 2002:ac8:4d1b:: with SMTP id w27mr6020430qtv.363.1617950799643; 
 Thu, 08 Apr 2021 23:46:39 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:46:27 +0000
Message-ID: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: Add WPCM450 support
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_074709_865090_1C4DA0C8 
X-CRM114-Status: UNSURE (   8.72  )
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
Message-ID: <20210409064627.3u4N4KVa9cgJK6xenhkMMH8r7jocTjAkTR4kkuo0f1o@z>

SGVsbG8gU29jIG1haW50YWluZXJzLAoKSGVyZSdzIGEgc3VwcG9ydCBmb3IgYSBOdXZvdG9uIHNv
YyBjb250cmlidXRlZCBieSBKb25hdGhhbi4gVGhlcmUgYXJlCmNoYW5nZXMgZm9yIHRoZSBpcnEg
Y29udHJvbGxlciwgdGltZXIgYW5kIHNlcmlhbCBwb3J0IHRoYXQgaGF2ZSBiZWVuCm1lcmdlZCBi
eSBvdGhlciBtYWludGFpbmVycy4gSSd2ZSBwaWNrZWQgdXAgdGhlIGFyY2ggYW5kIGRldmljZSB0
cmVlCmNoYW5nZXMgb24gaGlzIGJlaGFsZiB0byBnbyB0aHJvdWdoIHRoZSBzb2MgdHJlZS4KClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMDllNmQyYjcxYWU2NzNkY2NmOWY1OWYw
ZmMxZTE3MTA5MTEzYjZmNDoKCiAgQVJNOiBjb25maWc6IEFkZCBXUENNIHRvIG11bHRpIHY1ICgy
MDIxLTA0LTA5IDE1OjE4OjQwICswOTMwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9qb2VsL2JtYy5naXQKdGFncy9ibWMtNS4xMy13cGNtNDUwCgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gMDllNmQyYjcxYWU2NzNkY2NmOWY1OWYwZmMxZTE3MTA5MTEzYjZmNDoKCiAg
QVJNOiBjb25maWc6IEFkZCBXUENNIHRvIG11bHRpIHY1ICgyMDIxLTA0LTA5IDE1OjE4OjQwICsw
OTMwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpOdXZvdG9uIFdQQ000NTAgQk1DIFNvQwoKVGhpcyBhZGRzIGJhc2ljIHN1
cHBvcnQgZm9yIHRoZSBOdXZvdG9uIFdQQ000NTAgQk1DIFNvQy4gSXQncyBhbiBvbGRlcgpTb0Mg
YnV0IHN0aWxsIGNvbW1vbmx5IGZvdW5kIG9uIGVCYXksIG1vc3RseSBpbiBTdXBlcm1pY3JvIFg5
IHNlcnZlcgpib2FyZHMuCgpUaGlyZC1wYXJ0eSBkb2N1bWVudGF0aW9uIGlzIGF2YWlsYWJsZSBh
dDoKaHR0cHM6Ly9naXRodWIuY29tL25ldXNjaGFlZmVyL3dwY200NTAvd2lraQoKVGhlIGNvZGUg
aGFzIGJlZW4gY29udHJpYnV0ZWQgYnkgSm9uYXRoYW4gTmV1c2Now6RmZXIgd2hvIGhhcyBhbHNv
CnN0ZXBwZWQgZm9yd2FyZCB0byBtYWludGFpbiB0aGUgc29jLgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKb2VsIFN0YW5s
ZXkgKDEpOgogICAgICBBUk06IGNvbmZpZzogQWRkIFdQQ00gdG8gbXVsdGkgdjUKCkpvbmF0aGFu
IE5ldXNjaMOkZmVyICgxMCk6CiAgICAgIGR0LWJpbmRpbmdzOiBhcm06IENvbnZlcnQgbnV2b3Rv
bixucGNtNzUwIGJpbmRpbmcgdG8gWUFNTAogICAgICBBUk06IGR0czogQWRkIGJvYXJkLXNwZWNp
ZmljIGNvbXBhdGlibGUgc3RyaW5nIHRvIG5wY203NTAtZXZiIGRldmljZXRyZWUKICAgICAgZHQt
YmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogQWRkIFN1cGVybWljcm8KICAgICAgZHQtYmluZGlu
Z3M6IGFybTogbnBjbTogQWRkIG51dm90b24sd3BjbTQ1MCBjb21wYXRpYmxlIHN0cmluZwogICAg
ICBkdC1iaW5kaW5nczogd2F0Y2hkb2c6IG5wY206IEFkZCBudXZvdG9uLHdwY200NTAtd2R0CiAg
ICAgIEFSTTogbnBjbTogSW50cm9kdWNlIE51dm90b24gV1BDTTQ1MCBTb0MKICAgICAgd2F0Y2hk
b2c6IG5wY206IEFkZCBzdXBwb3J0IGZvciBXUENNNDUwCiAgICAgIEFSTTogZHRzOiBBZGQgZGV2
aWNldHJlZSBmb3IgTnV2b3RvbiBXUENNNDUwIEJNQyBjaGlwCiAgICAgIEFSTTogZHRzOiBBZGQg
ZGV2aWNldHJlZSBmb3IgU3VwZXJtaWNybyBYOVNDaS1MTjRGIGJhc2VkIG9uIFdQQ000NTAKICAg
ICAgTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBmb3IgTnV2b3RvbiBXUENNNDUwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
