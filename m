Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C07C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 23:49:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E8261185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 23:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E8261185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/xAVQbCsoP/GEmqijOcdhQ5BrYMTbmQurZC8Ckdo+6Q=; b=JTOxrcwJH7+hAWTKsl56z2o79
	x/Si4b0YgZqpxtL46KmHliowlx91fJ4MZ9NdVDYeKEJubEbEH4gq+vPcXIYz0GgfIaQwR8UFWMrUZ
	kxrD7w3FzmyG9pUaUO2czy5kDq9hbqOxEps50nEYQpjbu+OMjoJo2Szvfzcd8hZXU6+yiMVNzfky0
	zv/DLOCmFRsYPe3ZxrjqeV4Y0wIIXqcti7R5VhUBDXUuKZC+uNsUzJsBysgeUGguFNYyASnqma+TE
	cKNvUrtDoVt+/d9tQhLbUe3pucTX2vgaEE99ykXo1gtF7exL7I4zdvJeJhA/WdFqD5HtJk8TL/WRn
	ux1nHsyZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1limxq-00GRDW-DF; Mon, 17 May 2021 23:47:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1limxo-00GRDB-2T
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 23:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fQw+B4Aaj5WKO3XnxnjoJnOilFMUwgNj2+eQXaBMmEQ=; b=H/cmc75mybnrGhIoBLKHO+n9D8
 soLBtpb+l3lw5TFZ85mCXOUXii8PUmM15KohGxU6yd7zBsgmp49I5PK7ulA8oxI7akG1UdGSS0/D5
 l6TrdtVB0WK6mIHIUylrQ87l5poLV2aP3AnDR3uCb/gV+hYaagOHRB2/yFu7VOlkqZNnWvv2oLgHL
 DJe1HcTlt22tUGWlaaz0tON0Cg7sV7dHIwe61yQRHAhRW3VzvUH0eimZ3I2ZR7RVT/LqoYCkDraHW
 iPJyU9xV8e0X8NtmkBC+rZdUTetWVasJTfBpJhsV1pHadnB73kJgM9u4IxwKtdM7IxBq0hNdxAW5W
 H9B8E89g==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1limxl-00EDQ6-KP
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 23:47:54 +0000
Received: by mail-lj1-x22f.google.com with SMTP id e2so3001112ljk.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 16:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fQw+B4Aaj5WKO3XnxnjoJnOilFMUwgNj2+eQXaBMmEQ=;
 b=J1ZYxPyZ8cjCExpqI3RxldvZfmnGnKipWwx+N7Lb7oRmwpbvIklJ9GutZMVJ7sMckT
 qpXB83zq3QwBmgq94TsbLcg0jeWcA2SY+O81rPPvAPM3yHQyofYG1tgVl/86von7i5tj
 J0ChEu9e8bbKtPN1nYQl8AT6g8O2tmQaWXtGjj5jWDsyS+8r7krQQtsxWrYb8SGx9fXQ
 jiCauF4QXccJyeuZ+sl/kefEa0MATjf28rRE9vI38NS9abJfTzffYW8h/LsnpmpK1jyt
 Lrysdcfv4lF6UWY4I72PwRXq5w8786Pg4VcJkDxwlB4vVFV/3xkN6o0cNpijbuZmE0D9
 KWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQw+B4Aaj5WKO3XnxnjoJnOilFMUwgNj2+eQXaBMmEQ=;
 b=PKKhFlJ6qqsYfJ2kCZuA9UbFPV0Y0TZV9K0X1QS/KoXF+SExSuy4x0K8n80pqVg4w7
 m06BKfiKfLP1bHE2O12Hb7HvrCqBRSRYP9oXeNg9L35aVNzHodlo7pZjg3Z2vuXSpVQg
 A81xTATmflBWiDwAGSO4AQRJBPCuDKE8gjxrU49qJxZzpw2O4wJANV45t2VAixOF2h1F
 CkQ28dukgoemM6g+GApNsyKVqGiK8uteWXMJsXVIIiPoMyidw8T0m6uPNc4T/Bs98KDj
 t/R/P9uhMsmmDqZXshf9ZyGaTF2qNNlpG5JsSW8bU8JDPhDtx0U9XJqgrs+avJnJSRxu
 q4Og==
X-Gm-Message-State: AOAM530eIAcswyJZYNqRyyUSHJ3Y5oXfEeKYDbWnE2dat0h0QQogWGvI
 vCgESHpi492UEioOvG9yvhFJ0oDzpQCzHNfWi6M7nQ==
X-Google-Smtp-Source: ABdhPJxDXJyFBTKjv+mHs1r6TFAqKvhWB+ItK8dz6jjCTY8lwt/USQqO5WACAqPWuhy+6k0yqu4ISteDXDCbpU9JCdk=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr1591377lji.438.1621295271997; 
 Mon, 17 May 2021 16:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-6-clabbe@baylibre.com>
In-Reply-To: <20210517193205.691147-6-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 May 2021 01:47:41 +0200
Message-ID: <CACRpkdZeeij7ZM5C7eTUeOiBzvX_PKH4XwthEggFyJn5_QqdAw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: gemini: add device tree for ssi1328
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, 
 SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_164753_691030_C12F03FA 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210517234741.ySmDYVzdmtYEeSYC-Ucn0_pve065aLOf64Wg4D6_3n4@z>

Hi Corentin,

On Mon, May 17, 2021 at 9:32 PM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> The SSI 1328 is a NAS box running a SL3516 SoC.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Same question with redboot FIS and the pin control for the
flash here, otherwise it looks good!

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
