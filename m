Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA45C433ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 May 2021 23:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A8CF611BE
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 May 2021 23:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240770AbhEQXtV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 May 2021 19:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344581AbhEQXtK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 May 2021 19:49:10 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB2DC061573
        for <devicetree@vger.kernel.org>; Mon, 17 May 2021 16:47:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p20so9307721ljj.8
        for <devicetree@vger.kernel.org>; Mon, 17 May 2021 16:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQw+B4Aaj5WKO3XnxnjoJnOilFMUwgNj2+eQXaBMmEQ=;
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
        b=NyS8rL+E0cj+cAkhPIOhfVIDyVM1mFF4xtj80htJ1V0It5Sl43RYgy9g+9Mjup+0My
         0cW/Ral82KkttpDDChnsXtfCDuOuySr3140sTkZG2rBWU0vrQX6ceiMwP/x7XQD9CUIP
         yYIdRwgQZnj21Y7G/6V7hI1gc5nKtHBFYeJmE+B+EZ6+TapjZbHu0pqUWHqPPHmYNIIx
         rwplAYmO+L/aw4SQu88ykn36ozw8fXxCZU5qUUeKvOX1Th52ymh14MW+uUcy+EOzFFkC
         zDIMZaCy5opVVD0vvJmRUVTAc8UTDSXaMQ+IRQPkQu8nVcPU+cWQGURC7xH12nVr7PYZ
         gNJA==
X-Gm-Message-State: AOAM531UwxrjlcboSqYFAmVYpeRjV0tmZYHOul7Af3sQuuUTqMVWBd2p
        gxOsTmtv2cjf0MpL5uO+gOhLJhfqnuQpLZ9kvdZW/A==
X-Google-Smtp-Source: ABdhPJxDXJyFBTKjv+mHs1r6TFAqKvhWB+ItK8dz6jjCTY8lwt/USQqO5WACAqPWuhy+6k0yqu4ISteDXDCbpU9JCdk=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr1591377lji.438.1621295271997;
 Mon, 17 May 2021 16:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com> <20210517193205.691147-6-clabbe@baylibre.com>
In-Reply-To: <20210517193205.691147-6-clabbe@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 May 2021 01:47:41 +0200
Message-ID: <CACRpkdZeeij7ZM5C7eTUeOiBzvX_PKH4XwthEggFyJn5_QqdAw@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: gemini: add device tree for ssi1328
To:     Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210517234741.0CHMYoF536dfEii09NzXRwols49ypBNprBF0w04HxKw@z>

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
