Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F52C433ED
	for <linux-kernel@archiver.kernel.org>; Sun, 16 May 2021 16:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C00AA61073
	for <linux-kernel@archiver.kernel.org>; Sun, 16 May 2021 16:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhEPQ6I (ORCPT <rfc822;linux-kernel@archiver.kernel.org>);
        Sun, 16 May 2021 12:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhEPQ6G (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Sun, 16 May 2021 12:58:06 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B46C061573
        for <linux-kernel@vger.kernel.org>; Sun, 16 May 2021 09:56:50 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k10so5682699ejj.8
        for <linux-kernel@vger.kernel.org>; Sun, 16 May 2021 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=;
        b=P3YmCa/Sb01lTppd7f0Sb7fuidhircakszYHYjhrJtAHZBHwg8aB/zX3sMH3zjdSPM
         +Db5N7dbepitFXSQdr6ucA/MSYIr/e5yOGnEYKip7iEms/grB1taKYYJvne8R1Lnvk4k
         27yEJVf8s1M2IU56yrBQwoXFMT8cZz20DVAIaIU/vabuuQ3JaQRIuDxGCSkztBNSKJUx
         IknJz5HeGHENTDHVp8HytRo3SazyynuDx3Jzgn98izFef62ZR6xbq65zF6fztOLUlmjZ
         eBuKhY1qFaGyFbVRNBk64k93zyOt1Yko34cA2dWiQx3ZHF/DjbZivoTTDmN6sO0m/ZBo
         mhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=;
        b=N4TW9+RWh2STJGk5xYK9zfvlX1doXh/z3ehkirVEcc3Ds8ZN5jbOzSANJCLyXFASn3
         Epo4AbcNVnojGfI6qAzd1VCWa9tKbWo0WH0yaqnJbXyY/7wFiv2s2IjLMdFlLG5Dyns0
         Ha9qFurgnzebmb8+lSzCpahO8FoPJsbZbvQjRE9s+Qtx7/FrPxsyzkVj8N0R2n+8lX8A
         PNpqdOPZE2Vw0/d6tncYsPUAJ5cVq/XQcuM8OcO76TfsacxhovV/+AelRvxfGEITRlWM
         Vw5KKcN8IUHq1JL3lZGOWbN6hbWlZzrVkmiA9QaYVrZ+mZ9mlm1OrAkScQUYUNSoGHmj
         NcQA==
X-Gm-Message-State: AOAM533tDQLEbhr4ITBxno9KhUWeT1+eZkYTIIhLXcHHmrppisXNbtY7
        y7HS+hY/X8i49xMKFwAIUbhhVuLSdj+s4w4VnfU=
X-Google-Smtp-Source: ABdhPJwc41Kg2PCVAk+BV4t6/mT7qgy9bZ0g/8+LHR9oFdkh04GMWq15AhUV0qiUw+4YKrsy9vuUpMTLwDfrnBjDwOE=
X-Received: by 2002:a17:906:374b:: with SMTP id e11mr58369970ejc.328.1621184209341;
 Sun, 16 May 2021 09:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210511190054.26300-1-khilman@baylibre.com>
In-Reply-To: <20210511190054.26300-1-khilman@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 16 May 2021 18:56:38 +0200
Message-ID: <CAFBinCCTQMF8MAcffR30o5K06EKV==C-5EJ4_aEvZWWqSJ+eaQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
To:     Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc:     soc@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
Message-ID: <20210516165638.e21V4slN6hUNRcd_o_tZmYBx2KNnRMIm2Iz_iCRzuLM@z>

On Tue, May 11, 2021 at 9:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
> will now act as co-maintainer.
Thanks for your work since May 2016 Kevin!

> Neil is already doing lots of the reviewing, testing and behind the
> scenes support for users of the upstream kernel on these SoCs, so this
> is just to formalize the current state of affairs.
>
> Thanks Neil for all of your efforts, and keep up the great work!
Indeed, and also "welcome" to your new position Neil

> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin
