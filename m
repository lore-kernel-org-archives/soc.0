Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C734C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 13:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58737611C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 13:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58737611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8oKyJgoxL6i1wVu3xuUXQqU+h/kdoeILizdlHcuMKk=; b=R0gZqf02PpduMF
	C7ZUE1aLOAB5Jl983dEXTnAwJJph+zlpSWsJc/RAig8Hx7NtqUFn9F9KFMpYGYTehvSNIEBfiRxMH
	8ba04utOaB1b+uotXSgPqU6Tfq2/70mYN2Lt8ZIMj5B7ZkB00bjLZdo4LIItJcqNCj8KfKfVDA9lX
	9oGE1VgUWu/EXHNOsD/MpUHtf0rccpMfjHE3UHHsPMFljQNWJ7ExOvD28jE6jNTIfdpiZ3sRl5rEF
	MccVh/nItWEsxKrl4RowP6Mwl1ZstulMGaM0PliqNmBej6hOTo4i2u6ERdL56aGcS5eYGyqKDi44v
	UaZt6/SwTyGQId+wsNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdBiu-004cUO-Pf; Wed, 20 Oct 2021 13:33:40 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdBir-004cT9-8p
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 13:33:38 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mw9Dg-1mw65B3Y1M-00s82k for <linux-arm-kernel@lists.infradead.org>; Wed, 20
 Oct 2021 15:33:33 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 186-20020a1c01c3000000b0030d8315b593so1699141wmb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 06:33:33 -0700 (PDT)
X-Gm-Message-State: AOAM5325COBhsZhni6750YciLCEcBjyeLfPH30rGRcZzjD7HfMMHzReA
 B0hxyZvJBTkHOKa8NnFd3Be3DIzTczl1GrSpAss=
X-Google-Smtp-Source: ABdhPJxY/Ua7ZwYe4Z5WF5LhCFLVLILKFKBq3mgQsPNvFmW5mHTQv/qL3luMioBXbYeLCvcOb7xVR7smc7gDFtx2g/E=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr51896376wra.428.1634736813387; 
 Wed, 20 Oct 2021 06:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211019141228.1271617-1-pan@semihalf.com>
 <20211019141228.1271617-2-pan@semihalf.com>
In-Reply-To: <20211019141228.1271617-2-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Oct 2021 15:33:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
Message-ID: <CAK8P3a0g82DoivaADueeOcKOjNVDiutZLAAWAROzgvuYt83Z3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] socfpga: dts: move arria10 aliases to
 socfpga_arria10.dtsi
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, upstream@semihalf.com, 
 Marcin Wojtas <mw@semihalf.com>, Jacek Majkowski <jam@semihalf.com>,
 Konrad Adamczyk <ka@semihalf.com>, 
 Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>
X-Provags-ID: V03:K1:GAdKVYjOkwNGMwd2dAFPJ0VFRy8l/ZkqH5yF4O/bEnM325BEdsR
 Dk+1sj4ic2JXO5d6S/2LPJcdcSekoljV8UDbCsQjEPm3WrJ10Izq/qgVaR8q2G7/cidR1VE
 L9hjyBnVcVQkn7kZ1U0vcfS+72170HVFllKtGGW5eVw9ELRWQVJ7TvTzhaFCrubjjoY7KvU
 JxUfxa4tyk9PtPEaxM0jg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0LCvTeBUXAk=:fl1dxFf12taxS8hfjjlobt
 o7goIawjzbOtgRZQvtGz1jYymH+KcLaMDcqNjhd+fSqnPN8aX8KQiw6hJIU7NkjvWkJDqm0GD
 Q9yNLnXsH+aZTK8efyNrYANJ98WivDsKGvQG1K+6A1PMkvfsNPKBj8EmWo84kebEoKW1TNh55
 rPTh3rI5yIBNZkJ1CB40ogtRU+p+Jn3hGpyLvKBGqF9C8XZIiKys4UovG3maerld3k5lGcyG0
 Xc3JVYmYUUI5zrGzJIv59hDEE0IB4+/j8ef2FVUFgXQGV1VbtcPkN/Ijs0HZKZ0Tcw4GbDGxA
 IrN/B2LumB+oS2oN4MbE7UWwLkGxSaLu0w3SFEWuT/lIQwJDY3teo4w0xJIOpHejC9XXYfzqs
 LfRAawZRTW2hSc9XG0EoY6zh+frp9L6CUG68vI+KEUoX9YDO46jDNSSwDwgTVRuz47iBaUOMk
 vn8i7/3i/auyPWSyYnT0Myof6JVOKNR/DTIR4FyjWlCn7w1Z6UZ755pIyrDbuNdnPoECVAEnF
 1i88c+Sk0PszsDzBJl01CXomBhZs+/EZOjJ05Xp0+wEgVKGUe/eInJ0GW29+6xZKqkChHKHjw
 H/Lk5d1vVRV91s1gCAOJ/09W0t2/0ZvzNtEfi8IzF2ewSOdAS4gLZKfZPDmy/1nPKcVIRv65G
 vjBrIk8JTqoSCZSloqoMpPJb6V8CVLfowiMOZVB34pmu8P+Eq/EjVsLL8REq5VVQuv3xF0o2T
 O+jceM+GI0LnMf6FSqz6G4mmIb0s1NywD5I5mcW44tpEr/WkKMXOPdV6tRfJ6RfhYkgkhArEd
 PUOsmysPIdG/5wIIQ2Jrtl6SZmZZg8gTbisPVlb94kfJWvnRMInkthN/em1hJmQH7RhHiDufu
 M46Yg2k5Ni2YQmy67WPQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_063337_627741_40D8F809 
X-CRM114-Status: GOOD (  12.45  )
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
Message-ID: <20211020133317.5ZwOSaGsX1EePsoDpVNeLYkUOlNASTXvPLmFJGGuRGg@z>

T24gVHVlLCBPY3QgMTksIDIwMjEgYXQgNDoxMiBQTSBQYXdlxYIgQW5pa2llbCA8cGFuQHNlbWlo
YWxmLmNvbT4gd3JvdGU6Cj4KPiBzb2NmcGdhX2FycmlhMTBfc29jZGsuZHRzaSBkZWNsYXJlcyBh
bGlhc2VzIHdoaWNoIHdpbGwgbW9zdCBsaWtlbHkKPiBiZSB1c2VkIGJ5IG90aGVyIGFycmlhMTAg
Ym9hcmRzIGluIHRoZSBleGFjdCBzYW1lIHdheS4gbW92ZSB0aGVzZQo+IGFsaWFzZXMgdG8gdGhl
IHBhcmVudCBmaWxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1p
aGFsZi5jb20+CgpObywgcGxlYXNlIG1vdmUgdGhlbSBpbnRvIHRoZSAuZHRzIGZpbGVzIGluc3Rl
YWQgZm9yIGNvbnNpc3RlbmN5LgoKRWFjaCBib2FyZCBtYXkgdXNlIGEgZGlmZmVyZW50IHN1YnNl
dCBvZiB0aGVtLCBvciBoYXZlIHRoZW0KbnVtYmVyZWQgZGlmZmVyZW50bHksIHNvIGtlZXAgaXQg
b3V0IG9mIHRoZSAuZHRzaSBmaWxlLgoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
