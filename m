Return-Path: <SRS0=Tcyv=NL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99AFC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 19:58:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AF076115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 19:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AF076115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWzQC0v0KhV3Cark4IFXQYF9FokcF3a/JnqUVg+tTg8=; b=AzwYc3GqDmtP1e
	1PMMK0W3/fZsRvnoilVnvOVQd8/hHykGzxjY4AsOr0bEvw2GJ1gfkD9No41BtEUqp0ixVQVXwK++8
	l1e3SPUoDMRMdgA3xg9vbez6Ztb1IQOVKumQxUy2tGbBK6jgK9Ce6iunSJXbNQI71csYp7NTcnILf
	aCoqv7bx/FWHdpMAXQolefpBT6JmVeXQcbpjlB3aZxivtDGtH+MhbWajiVGuLgTljobHJROeCVdXh
	mWQE8VifkM5MCpkOFUzIkgVPbRRWUzvsUrW+/Iq/XXmHLh3k3sm15ts+/U6htscDwAMfcL9VI11TD
	FDc8hhuH0+yjBbEH04Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHAci-00C0jk-F7; Fri, 20 Aug 2021 19:56:16 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHAce-00C0j9-Lw
 for linux-arm-kernel@lists.infradead.org; Fri, 20 Aug 2021 19:56:14 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M4aEC-1mIpJf3fhG-001kdp for <linux-arm-kernel@lists.infradead.org>; Fri,
 20 Aug 2021 21:56:09 +0200
Received: by mail-wr1-f49.google.com with SMTP id h13so15816878wrp.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 20 Aug 2021 12:56:09 -0700 (PDT)
X-Gm-Message-State: AOAM530tXp3KQuCpbVFoL46r0qgQnT8vN+sKGUTN3N8p6VKlW2RIeOnQ
 Ht1/rxyaYLcf59T5BK4wFM3yCnhiCj68sKb2+PQ=
X-Google-Smtp-Source: ABdhPJxlsOZO56JajrT3f4dcrPBCUnIdfw1q5w7mc1qjtBPwrpWswZjsj3ahvDK6RwyOb2e2+QJZRAZJL69/UIIllqY=
X-Received: by 2002:adf:e107:: with SMTP id t7mr485780wrz.165.1629489369140;
 Fri, 20 Aug 2021 12:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210820173108.01d5c6de@xhacker.debian>
 <29e96ece-8541-a7a2-c6a9-453be6644eed@canonical.com>
 <20210820182708.51d13e29@xhacker.debian>
In-Reply-To: <20210820182708.51d13e29@xhacker.debian>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 Aug 2021 21:55:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com>
Message-ID: <CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: synaptics: add DT for AS370-RDK
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 SoC Team <soc@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>
X-Provags-ID: V03:K1:y30ikxApBhjCH5Tf7sB+RU6SzCj64hcsf6ExyTGZWhXgX59U9AG
 sMDggenHJNciCVNgyqnDXbgl4SnWnGTaRX5rrzdj/Mvt0rZzTHwcI3gvNNi5Z8VlS7mMC4E
 SueQS1Wx5apHMeFvIUnQTCBgpej+zYK06KUoiyOanjazgdGC+P9tl2PcH9qf/zN89TIfN7b
 2c8GXkH9weh3/QEjDiyWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uVfzblVzXBU=:mwjnKXAn3rRkgvIaFzNnvB
 aKMKbwMZlja6ORPMD2M/MgbCaIH/16D9mP/bkSI3jLdCo0qXCbd4/FWdQOK7Knxg6FfvGkgOp
 P+NPwVQPVC9CPydu+iw3m1ual+aB0Nw/4TX9HUCh6mJKkXng2HqWSICxyj3r+QTApq+r5AIA/
 dR6V6OsAxCJBJXBuqAC25fajCvMQVHFxUzdhmkkO06OlxKF03PBqWoUWveD0uDsBo+7yroxPE
 dJtUpCplmgWQeULTJJl4a9oBIL1v9+hq20EB2JadyqhfAby29Q3fu1lneDfWJ+ShNLa+QzT6I
 VgFhUpSETvyPp3FUnUxZqRJenjHB0NK/azCNg9IYhaEvoSJz9OhjHD4ea/eVmrWnI6pPg2qXO
 aJKxXxyxavanRf7rHSMjD5zeqguY98Au7muJTXnj7vQY9wWtJ8yPDIPT0OtNnJpR2olxt6+j+
 mI4MIYMJDKKTLbWfxXFXAt6XUZ2RpOXlc8n5s0zqxmTmEf9PiIrLsNdI4QN7nDl8pRCVP2lep
 Riu1CYy+Gg3DP4s6LhKka4ZMu6qcsN/auaz78NjLojbAC2dIFuBEhRG8DwWl6rnuitR+Eg7GR
 4bYszGYTuWwP/rd+dcTNdzlEK+tuYySwNdnKT4zYmM1OLzOXjZJEYGtN/XyIRamJoe3sQCqFm
 Dop2GnIjOuG0H3cvvqxoSt74slnE4CCFATbxZf+R2KOLjqxxzKkcGZQnV//b6UaxUAoPaXPAH
 fIm4u5+3mwUv4zlKuTpHnn+bBBJ7jAepGncj1amLOIx9QuxFuJCmXNe/AL1eBkzqBddPpsBFK
 +8Fpq13NW5KqNVsxPjgpjDYiUua4AVhYh+rosnxkXFXBXzKcGoN/dZSUp7sTRQM67Kxaa/e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_125613_057986_C4B4D183 
X-CRM114-Status: GOOD (  17.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210820195553.qJ-Xpaoy9BfWOPaUbuYhFlLuKQEU4V5nLZ3kQDebPVs@z>

On Fri, Aug 20, 2021 at 12:27 PM Jisheng Zhang
<Jisheng.Zhang@synaptics.com> wrote:
> On Fri, 20 Aug 2021 11:59:30 +0200 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > On 20/08/2021 11:31, Jisheng Zhang wrote:
> >
> > There is no such binding. You need to update the bindings file (first
> > patch in the series).
>
> This is my plan ;) In fact, "berlin4ct" related binding is also missing.
> I want to convert Documentation/devicetree/bindings/arm/syna.txt
> to yaml, then add missing bindings. But it's too late for 5.15,
>
> If it's fine to keep as370.dtsi without board user(s), we can drop
> this patch. I will solve this issue in next development window.

Yes, doing it for the next cycle is ok.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
