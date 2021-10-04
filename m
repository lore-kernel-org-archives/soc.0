Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15C3C433F5
	for <linux-kernel@archiver.kernel.org>; Mon,  4 Oct 2021 13:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4F9161244
	for <linux-kernel@archiver.kernel.org>; Mon,  4 Oct 2021 13:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238740AbhJDN6J (ORCPT <rfc822;linux-kernel@archiver.kernel.org>);
        Mon, 4 Oct 2021 09:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238593AbhJDN57 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 4 Oct 2021 09:57:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADF2C04E2E2
        for <linux-kernel@vger.kernel.org>; Mon,  4 Oct 2021 06:51:02 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b136-20020a1c808e000000b0030d60716239so5976577wmd.4
        for <linux-kernel@vger.kernel.org>; Mon, 04 Oct 2021 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ixcLdTagJRu/06gC176lfPRdoFQRHt0CXg6VWfHheVY=;
        b=p6TDaGTFlpLS+iMuviaB8B07k0Ae0uBloriBCGPD6Rrdgs9T0CVQcM1WFsIzGzqRh4
         rzJ2nflnlUjmgNTKvOp4HOnH39FUwKc9dNzsjATrAk6hzT3jQ6bOhMIBpi0iQhJMw6BI
         wotyqWu9/oW7G/Y2SEOnTsaKTFQUfyr48vOBADEdoWxiKc1BaCy++HOyiq6F/uQao6Iq
         /4GQOe7YvDcD7JwNqkKmmcFu6iULtZbTs0VgkGejb3JQpgBjfcelhjREylmPQmZGW0BW
         wCnlC9fwjpcLbd24WvMLdhjOKyCeLbppTbFikG2nR9Cx/sWND3dI05tPFInq0wGiYb5C
         dlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixcLdTagJRu/06gC176lfPRdoFQRHt0CXg6VWfHheVY=;
        b=mMOdESvmD+cmXvQBuGFvGPRRrslEth9EwoUDQgCVP3Ochf/LyNVwpzAVgOAXM7e0tJ
         kxBmRtBdgxuBKDJPqmxAVuYviAZIVPd3QN0h7P4Bri1AQOV4ocJTNSWhm0zQL9qsD0P7
         MZV4dXDQbdLIWm04dxhpaaPt7NoAIYx2LFLbanQ8AM1ysoCzV+9/T/DWW12YzdwUZeYo
         N53v7KdhXqlZb5iF5JGE5euX/rMifSLUi9p8N28hBQID6q/yD+iMvyxowJPMj/+wekOL
         GpVryeXEQfj5ujiUxErQ55KN9Jdfugaw9qMuFrpj7bBzcq0hsbaF65qLXKiejabHdTRO
         q/xA==
X-Gm-Message-State: AOAM532INEbQSX7IAJghpFplJB/C8bxqxXEsTHdAPKwo09JOZ7r29LfQ
        QuvkDM+wdVt7lC66aU4tX0VZst8xxAgW1a3vFN+jdg==
X-Google-Smtp-Source: ABdhPJw1v2ZRogF2DMasR0MEbo1LWWhq0iSwwVnx7mfGK0MtGZblExODYu8l8WDnhe6n4XGcNYOzK3roxkxLprcfO0w=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr1524425wmg.177.1633355461387;
 Mon, 04 Oct 2021 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210915113813.GA509196@jade>
In-Reply-To: <20210915113813.GA509196@jade>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon, 4 Oct 2021 15:50:50 +0200
Message-ID: <CAHUa44EZeE4pWmYFTfoBBxL4AhjTbRBS8vv6=M1UksL-oO_Rzw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fix for v5.15
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc:     OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        CGEL <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
Message-ID: <20211004135050.Q3EsVHWki5zF5VbyEa04pjD2mbE-lP_IePcgrRc7Yok@z>

Hi,

Is there any problems with this, or is it just that you'd rather take it later?

Thanks,
Jens

On Wed, Sep 15, 2021 at 1:38 PM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hello arm-soc maintainers,
>
> Please pull this small OP-TEE driver fix for the shared memory pool
> handler. The fix doesn't change the generated code, but it's still relevant
> since the problem obviously triggers warnings with some tools.
>
> Thanks,
> Jens
>
> The following changes since commit 7d2a07b769330c34b4deabeed939325c77a7ec2f:
>
>   Linux 5.14 (2021-08-29 15:04:50 -0700)
>
> are available in the Git repository at:
>
>   git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.15
>
> for you to fetch changes up to 88a3856c0a8c03188db7913f4d49379432fe1f93:
>
>   tee/optee/shm_pool: fix application of sizeof to pointer (2021-09-14 07:54:56 +0200)
>
> ----------------------------------------------------------------
> Fix OP-TEE shm_pool lint warning
>
> ----------------------------------------------------------------
> jing yangyang (1):
>       tee/optee/shm_pool: fix application of sizeof to pointer
>
>  drivers/tee/optee/shm_pool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
