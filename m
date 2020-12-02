Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9530FC64E7B
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 13:32:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3AA4522245; Wed,  2 Dec 2020 13:32:43 +0000 (UTC)
X-Gm-Message-State: AOAM531xRqbI6WAzORZ20VnlEF+cNRV+t7KbzzL9iB55boJ/f7KqkXRo
	F3kEigs9VHGYRjJEy2BPSz0kT7Pa6ojyqR+4SYo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606915963;
	bh=GjKPE/5pUWahjMz+C8wBn0rHEqEgRf7Y1T/5BiVPVUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lG7uPkbNZWFkzGDlSHe87J65sdcYl2X+sho6PadEkZx4O1TZEqIn8XTDhZwd4fMt9
	 1FRmJVFXwa0jrYzSBEmtoy1GNJbPQ8B1AsSEeWWfhFoyw0lqGsKM+HO6ni62LXfF6I
	 nV7qXXEbVLb000uJnBxvpg0yS5bdGACzBUWznIW8=
X-Google-Smtp-Source: ABdhPJzJi2RObb0X9bNsDMSLntmG4xvSK0VFUacYLE0f4+qEh+PeCVNQQTiv8BggX8EDptcQXgg2oqZQ+G+JIuKbXOw=
X-Received: by 2002:aca:fd42:: with SMTP id b63mr1465760oii.11.1606915961923;
 Wed, 02 Dec 2020 05:32:41 -0800 (PST)
MIME-Version: 1.0
References: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
 <CAK8P3a1o6Dt0wakXB=sUC-t9DkFqSe=ZwSMYtYKsoZNaNfXUew@mail.gmail.com> <bb576e8d-cf11-4f3d-6b9c-6944e6795c2a@foss.st.com>
In-Reply-To: <bb576e8d-cf11-4f3d-6b9c-6944e6795c2a@foss.st.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 2 Dec 2020 14:32:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a11yRgy9x-cHNDsuYfLPcg0YFs92T+BxzfNisOqjNCjNw@mail.gmail.com>
Message-ID: <CAK8P3a11yRgy9x-cHNDsuYfLPcg0YFs92T+BxzfNisOqjNCjNw@mail.gmail.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.11 #1
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 12:00 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
> On 11/27/20 8:42 PM, Arnd Bergmann wrote:
> > On Fri, Nov 27, 2020 at 9:54 AM Alexandre TORGUE
> > <alexandre.torgue@foss.st.com> wrote:
> >>
> >> Please consider this first round of STM32 DT updates for v5.11. As usual
> >> main changed concern MPU part. Various fixes have been done, a new board
> >> has been added for DH and USB type C support has been added for ST DK
> >> boards.
> >
> > Out of curiosity, what is your impression of the state of the MCU port?
> >
> > It seems to me that STM32H7/STM32F7 is by far the most active NOMMU
> > platform in mainline Linux (with some activity for j2 and recently rv64), but
> > it's also much less active than it was a few years ago and slowly winding down
> > further, presumably as other OSs are getting better and full-featured MPUs
> > are getting almost as cheap.
>
> There is 2 kinds of activity around our MCU products: one coming from ST
> team (as most of peripherals are common with our MPU, changes done for
> MPU are reported to MCU). And another coming from external people using
> those MCU boards (few people).
> There are still improvements to do for those platforms like adding dma
> support on cortex-M7 (which implies to use dedicated MPU region ...) but
> I don't have as much time as I would like to work on this subject so it
> is still pending.
> I would say that stm32 mcu linux support continues to survive with
> incoming patches and at rhythm of the incoming patches.

Ok, thanks for the background!

> > I also tried to find modern distro support, but I couldn't find anything that
> > has the elf-fdpic changes that were merged into mainline gcc, instead
> > it seems any user space is either on binfmt-flat or using elf-fdpic with
> > ancient patched compilers that can build user space but no longer
> > build the kernel (which now requires gcc-4.9 or higher), so I wonder if
> > I'm looking in the wrong places, or if this just doesn't work.
>
> Some STM32 MCU are supported in buildroot (not all), using u-boot as
> bootloader and binfmt-flat for user space. Concerning fdpic, IIRC
> support has been added in buildroot but we don't use it yet for our STM32.
>
> > Overall, is this something where you only support existing users for
> > as long as they are around, or do you keep seeing new products based
> > on STM32F4/F7/H7?
>
> I just continue to support existing users and I don't plan to push
> another STM32 MCU.
>
> Do you think we should better promote/support NOMMU
> platform in  mainline?

No, I think what you do is absolutely appropriate given the current
state: keep the existing users happy but minimise the work needed
for that.

It would however be good if you could let everyone know once
you notice a further decrease in interest over time, as I think we
do want to retire NOMMU kernels eventually, and confine the users
to stable kernels once there are few enough of them. Out of the
remaining NOMMU architectures, this is what I observe:

- ARM: most activity is on stm32, once this one gets retired, the
  other ones can probably go as well

-  m68k: actively maintained, but aging: the newest NOMMU
   chip (MCF537x) is from 2007.

- SuperH: SH2/SH2A is practically dead, minimal J2 support
  was added in 2016, apparently it is still work-in-progress
  but progressing slowly

- riscv: K210 support was only added in 2020 and is
  actively being worked on at the moment, as there are
  very few affordable RISC-V systems at all. This might
  change as soon as one can easily buy a cheap RV64
  board with an MMU.

- microblaze: NOMMU support to be removed in v5.11 or v5.12

- h8300: there is talk of removing the architecture

- c6x: still (barely) maintained, but I could find no indication of
  actual users

- xtensa: one defconfig has MMU disabled, but has always
  failed to build as far as I can tell. Max has an out-of-tree
  patch series for the ESP32, but has not updated it since
  v5.6.

Overall, there is clearly still enough going on to keep it around
for a while, but not much that anyone gets excited about.
If you ever stop testing and updating the STM32 MCU platform,
I think we should ask the other maintainers if any of the
remaining platforms are important enough to keep NOMMU
supported at all, or if one of the future LTS releases should be
planned as the last  one to have a NOMMU option.

      Arnd
