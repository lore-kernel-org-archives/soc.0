Return-Path: <SRS0=pZgq=FQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B832C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 02:50:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D306622DFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 02:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D306622DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CrxMbkdcJFhLbUhczPEXJNNoFo4p9jpJButbotIisqQ=; b=Zyd5pCtOcWudnDyko1/k1YTR7
	DmM7o0o0GV+yl3SuRaCJPf9fDFebbijOD4egboUBv/FCJVlHEn/WeR4FZQzNaRVlY6QgCST1QTguK
	YTmn2Ym2mwCsIanVoHLUZqxSISq5qzB7+a/QTs0/9VU9gIH5jUHV58g7tuf9IrK/Uy3Fqdcqm53Oe
	K8Ng7n/7qP9tHU2qI/aZF3waBz+fYJebhlOw/RiwMFNRomTUjPfGuSbXevAwrQQwjh3zqf/Oa+b1M
	NbEF/3FcB9YReIpQxRzr46UZuzZlLruxH+wKsbA/rfBtyheMA/6bD1p/ViXF8YZwvQAvSkkMV+H2W
	QtX7FPXuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knuxt-0006eL-Lu; Sat, 12 Dec 2020 02:48:57 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knuxr-0006dn-1E
 for linux-arm-kernel@lists.infradead.org; Sat, 12 Dec 2020 02:48:55 +0000
Received: by mail-qv1-xf44.google.com with SMTP id 4so5216748qvh.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Dec 2020 18:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TQduMYVqARw6+qxqGvjM2j3q/xasIzk15UolBcHLkzs=;
 b=lOcZzWTS5jP44Aj5WSnu7Epwi9SIeLpdqG0g7vfXGzHB22bQkXbMPXEOWMrckkpM/q
 8/dGI+MZP9fHvUF4GA8nH3L32jW3q7WD36klvhRf13cEcqlfcQyEM9ypCA+KOXPrrvMA
 uosYL5WdTCiNn5dnUL0xOD6VgodW8s5Ow3BCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TQduMYVqARw6+qxqGvjM2j3q/xasIzk15UolBcHLkzs=;
 b=kMkmNQKJSd2mmT4dg9kvOQXQFgPYycG57A14lHiVcSs0ZALy17y94CkWVyOLNk7p2O
 KP8H6EntxDFvjfWo84UffLXbM1UQNotG1MC+0U8LchNU8XRAtnPXCjKvYD+1VlNxy45R
 Sdcs2x7CQHsIvIDDnTB3FTg7aDpc6LVJd2VhQ1iYkCIgoInwzEdWoM0ExVCgdZgiBs94
 M6MgWZtbsgaqSNcFAkmTEoVWeEtsjBftI9HOJ4SOg1i5aiHIKSrvZO3nqqRwacWs30om
 QR9d1gDK3W3KKI8OqGNNdriYHJKE76ZfnJEU/b8eiG981sa7ptw13tNfIsxQAuF6boXR
 daMg==
X-Gm-Message-State: AOAM532icWfnUnVZry1SiOpi44OoL2lZ/44fLr9nw9/yS9gyoAwqkHtT
 /hXq7/EX6FEXgTupeB78hq6FyV1Xp9kqt6YC4S32a+9l4cWOrw==
X-Google-Smtp-Source: ABdhPJwggpEKL14wC5+OproRa+ET7RUsSVcrTd8K7mQPC5vj9AIEfNRFdDaAkFcYA2Eg9tmZEAPR5tj7FGZTJZqZwuM=
X-Received: by 2002:ad4:43ea:: with SMTP id f10mr19617485qvu.52.1607741332882; 
 Fri, 11 Dec 2020 18:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201212024643.388335-1-daniel@0x0f.com>
In-Reply-To: <20201212024643.388335-1-daniel@0x0f.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 12 Dec 2020 11:48:42 +0900
Message-ID: <CAFr9PXkz_3VNtQothDPdfhpYBOz_kHqykjftUn7no9yWzVrEnw@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: mstar: Unify common parts of BreadBee boards
 into a dtsi
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_214855_130342_C76D4A79 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201212024842.D2Hf6kSPYkskrBnBMKO_NXrAn5hBq2Ji8Hqle3MDI1k@z>

Hi all,

>[PATCH 1/7]

Sorry, this isn't actually a 1/7 it's 1/1. I forgot to fix the subject
before sending.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
